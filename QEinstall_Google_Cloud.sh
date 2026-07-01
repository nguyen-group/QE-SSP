#!/bin/bash

# In this version, we install for the Google Cloud Platform (GCP) Ubuntu 20.04 LTS virtual machine.

set -e

DEB_FILE="quantum-espresso_7.5-1_amd64.deb"
DEB_URL="https://github.com/pranabdas/espresso/releases/download/qe-7.5-1/quantum-espresso_7.5-1_amd64.deb"

wget "$DEB_URL"

chmod 644 "$DEB_FILE"

sudo cp "$DEB_FILE" /tmp/

sudo apt update
sudo apt install -y "/tmp/$DEB_FILE"

# Add QE vào PATH
if ! grep -q '/opt/espresso/7.5' ~/.bashrc; then
    echo 'export PATH="/opt/espresso/7.5:$PATH"' >> ~/.bashrc
fi

# Set OpenMP thread
if ! grep -q 'export OMP_NUM_THREADS=1' ~/.bashrc; then
    echo 'export OMP_NUM_THREADS=1' >> ~/.bashrc
fi

export PATH="/opt/espresso/7.5:$PATH"
export OMP_NUM_THREADS=1

if which pw.x > /dev/null 2>&1; then
    echo "Finished installing QE.7.5"
    rm -f "$DEB_FILE"
    sudo rm -f "/tmp/$DEB_FILE"
else
    echo "Error: pw.x not found in PATH"
    exit 1
fi

echo "localhost slots=4" > hosts

python3 -m pip install matplotlib

echo "Finished installing Matplotlib"