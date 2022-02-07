#!/bin/bash
# Explore the effect of an increasing energy cutoff
###############################################################

for pp in C.pbe-n-rrkjus_psl.0.1.UPF C.pz-n-rrkjus_psl.0.1.UPF \
C.pbe-n-kjpaw_psl.1.0.0.UPF C.pz-n-kjpaw_psl.0.1.UPF \
C.pbe-hgh.UPF C.pz-hgh.UPF; do

cat > vc-relax.$pp.in << EOF
&CONTROL
calculation   = 'vc-relax'
pseudo_dir    = '../pseudo/'
outdir        = '../tmp/'
prefix        = 'gr'
etot_conv_thr = 1.0D-5
forc_conv_thr = 1.0D-4
/
&SYSTEM
ibrav         = 4
a             = 2.4639055825
c             = 15.0
nat           = 2
ntyp          = 1
occupations   = 'smearing'
smearing      = 'mv'
degauss       = 0.02
ecutwfc       = 80
/
&ELECTRONS
mixing_beta   = 0.7
conv_thr      = 1.0D-9
/
&IONS
ion_dynamics  = 'bfgs'
/
&CELL
cell_dynamics = 'bfgs'
press_conv_thr= 0.05
cell_dofree   = '2Dxy'
/
ATOMIC_SPECIES
C 12.0107 $pp
ATOMIC_POSITIONS (crystal)
C  0.333333333  0.666666666  0.500000000
C  0.666666666  0.333333333  0.500000000
K_POINTS (automatic)
12 12 1 0 0 0
EOF

mpirun -np 4 pw.x <vc-relax.$pp.in>vc-relax.$pp.out

done
