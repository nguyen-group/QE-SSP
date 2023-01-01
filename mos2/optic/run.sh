mpirun -np 4 pw.x <scf.in> scf.out
mpirun -np 4 pw.x <nscf.in> nscf.out
mpirun -np 4 epsilon.x <epsilon.in> epsilon.out
mpirun -np 4 epsilon.x <epsilon-jdos.in> epsilon-jdos.out
