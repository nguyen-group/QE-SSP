#! /bin/bash
mpirun -np 4 pw.x < scf.in > scf.out
mpirun -np 4 ph.x < ph.in > ph.out
mpirun -np 4 dynmat.x < dynmat.in > dynmat.out
