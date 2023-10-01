#!/bin/bash

# Alternative version of QEinstall.sh:
# In this version, we install necessary Python libraries and Jupyter Lab
# using default repositories of Ubuntu/Debian, NOT by pip.

# Update list of repositories and upgrade the system
sudo apt -y update
sudo apt -y upgrade

# Important development tools and libraries:
# Git, wget, gcc/g++/gfortran, LAPACK, FFTW, openmpi (mpirun)
sudo apt -y install git wget build-essential g++ gfortran liblapack-dev libfftw3-dev libopenmpi-dev

# Quantum ESPRESSO and Wannier90
sudo apt -y install quantum-espresso wannier90

# Additional tools
sudo apt -y install xcrysden gnuplot
sudo apt -y install python3-dev jupyter-server
sudo apt -y install python3-numpy python3-scipy python3-sympy python3-matplotlib

# Completion message
echo "Installation finished!"
echo "Let's start our journey with QuantumESPRESSO!"
