set style data dots
set nokey
set xrange [0: 3.11411]
set yrange [ -8.82625 :  5.56065]
set arrow from  1.31617,  -8.82625 to  1.31617,   5.56065 nohead
set arrow from  1.97426,  -8.82625 to  1.97426,   5.56065 nohead
set xtics ("G"  0.00000,"K"  1.31617,"M"  1.97426,"G"  3.11411)
 plot "mos2_band.dat"
