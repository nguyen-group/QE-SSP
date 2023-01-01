mpirun -np 4 pw.x <gete.scf.in> gete.scf.out
mpirun -np 4 pw.x <gete.nscfdos.in> gete.nscfdos.out
mpirun -np 4 dos.x <gete.dos.in> gete.dos.out
mpirun -np 4 pw.x <gete.nscfbands.in> gete.nscfbands.out
mpirun -np 4 bands.x <gete.bands.in> gete.bands.out
