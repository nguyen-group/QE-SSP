#! /bin/bash
# VC-RELAX for Graphene
####################################

mpirun -np 4 pw.x < vc-relax.in > vc-relax.out
