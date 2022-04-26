#!/bin/bash

# Update list of repositories and upgrade the system
sudo apt -y update
sudo apt -y upgrade

# Important development tools and libraries:
# Git, wget, gcc/g++/gfortran, LAPACK, FFTW, openmpi (mpirun)
sudo apt install git wget build-essential g++ gfortran liblapack-dev libfftw3-dev libopenmpi-dev

# Quantum ESPRESSO and Wannier90
sudo apt install quantum-espresso wannier90

# Additional tools
sudo apt install xcrysden gnuplot
sudo apt install python3-dev python3-pip
pip3 install numpy scipy sympy matplotlib jupyterlab

echo "Installation finished!"
echo "Let's start our journey with QuantumESPRESSO!"
