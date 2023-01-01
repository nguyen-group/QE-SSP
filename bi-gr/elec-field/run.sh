mpirun -np 4 pw.x <scf.in> scf.out
mpirun -np 4 pp.x < pp.in> pp.out
average.x <average.in> average.out
mpirun -np 4 pw.x <nscf.in> nscf.out
mpirun -np 4 bands.x <bands.in> bands.out
