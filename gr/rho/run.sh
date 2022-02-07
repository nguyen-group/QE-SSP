#! /bin/bash
# Charge density of Graphene
###################################

mpirun -np 4 pw.x < scf.in > scf.out
mpirun -np 4 pp.x < pp.in > pp.out
