#! /bin/bash
# Density of states (DOS) of Graphene
#####################################

mpirun -np 4 pw.x < scf.in > scf.out
mpirun -np 4 pw.x < nscf.in > nscf.out
mpirun -np 4 dos.x < dos.in > dos.out
