#! /bin/bash
# RELAXATION for Graphene
####################################

mpirun -np 4 pw.x < relax.in > relax.out
