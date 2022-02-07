mpirun -np 4 pw.x <scf-dense.in> scf-dense.out
mpirun -np 4 pw.x <scf.in> scf.out
mpirun -np 4 ph.x <ph.in> ph.out
mpirun -np 4 q2r.x <q2r.in> q2r.out
mpirun -np 4 matdyn.x <matdyn.in> matdyn.out
