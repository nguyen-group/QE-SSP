#!/bin/bash
# Convergence test of k-points grid.
# Set a variable k-point from 4 to 14.
for k in 4 5 6 7 8 9 10 11 12 13 14; do
# Make input file for the SCF calculation.
# k-points grid is assigned by variable n.
cat > kpoint.$k.in << EOF
&CONTROL
calculation  = 'scf'
pseudo_dir   = '../pseudo/'
outdir       = '../tmp/'
prefix       = 'gr'
/
&SYSTEM
ibrav        = 4
a            = 2.4623
c            = 10.0
nat          = 2
ntyp         = 1
occupations  = 'smearing'
smearing     = 'mv'
degauss      = 0.02
ecutwfc      = 40
/
&ELECTRONS
mixing_beta  = 0.7
conv_thr     = 1.0D-6
/
ATOMIC_SPECIES
C 12.0107 C.pbe-n-rrkjus_psl.0.1.UPF
ATOMIC_POSITIONS (crystal)
C  0.333333333  0.666666666  0.500000000
C  0.666666666  0.333333333  0.500000000
K_POINTS (automatic)
${k} ${k} 1 0 0 0
EOF
# Run pw.x for SCF calculation.
mpirun -np 4 pw.x <kpoint.$k.in>kpoint.$k.out
# Write the number of k-points (= k*k*1) and
# the total energy in calc-kpoint.dat
awk '/!/ {printf"%d %s\n",'$k*$k',$5}' kpoint.$k.out >> calc-kpoint.dat
# End of for loop.
done
