#! /bin/bash
# SCF for Graphene
####################################

mpirun -np 4 pw.x < scf.in > scf.out
