#!/bin/bash
# Explore the effect of the smearing functions and energies

# Set a variable sf for the smearing functions.
for sf in fd gauss mp mv; do
# Set a variable se for the smearing energies.
for se in 0.005 0.010 0.015 0.020 0.025 0.030 0.035 0.040; do

# Make input file for the scf calculation.
cat > $sf.$se.in << EOF
&CONTROL
calculation   = 'scf'
pseudo_dir    = '../pseudo/'
outdir        = '../tmp/'
prefix        = 'gr'
/
&SYSTEM
ibrav         = 4
a             = 2.4639055825
c             = 15.0
nat           = 2
ntyp          = 1
occupations   = 'smearing'
smearing      = '$sf'
degauss       = $se
ecutwfc       = 40
/
&ELECTRONS
mixing_beta   = 0.7
conv_thr      = 1.0D-6
/
ATOMIC_SPECIES
C 12.0107 C.pbe-n-rrkjus_psl.0.1.UPF
ATOMIC_POSITIONS (crystal)
C  0.333333333  0.666666666  0.500000000
C  0.666666666  0.333333333  0.500000000
K_POINTS (automatic)
12 12 1 0 0 0
EOF

# Run pw.x for SCF calculation.
mpirun -np 4 pw.x <$sf.$se.in> $sf.$se.out

# Write the name of the smearing functions, the smearing energies, and total energies.

awk -v var="$sf" '/!/ {printf"%-6s %1.3f %s\n",var,'$se',$5}' $sf.$se.out >> calc-smearing.dat

# End of for sf loop.
done
# End of for se loop.
done
