#! /bin/bash
# Partial density of states (PDOS) of Graphene
##############################################

mpirun -np 4 pw.x < scf.in > scf.out
mpirun -np 4 pw.x < nscf.in > nscf.out
mpirun -np 4 projwfc.x < projwfc.in > projwfc.out
