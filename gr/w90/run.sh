mpirun -np 4 pw.x <scf.in> scf.out
mpirun -np 4 open_grid.x <open_grid.in> open_grid.out
wannier90.x -pp gr
mpirun -np 4 pw2wannier90.x <pw2wan.in> pw2wan.out
wannier90.x gr
