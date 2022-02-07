#! /bin/bash
# Band structure of Graphene
############################

mpirun -np 4 pw.x < scf.in > scf.out
mpirun -np 4 pw.x < nscf.in > nscf.out
mpirun -np 4 bands.x < bands.in > bands.out
