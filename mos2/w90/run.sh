#! /bin/bash
# Band structure with HSE for MoS2 monlayer
###########################################
mpirun -np 8 pw.x < scf.in > scf.out
mpirun -np 8 open_grid.x < open_grid.in > open_grid.out
wannier90.x -pp mos2
mpirun -np 8 pw2wannier90.x < pw2wan.in > pw2wan.out
wannier90.x mos2
