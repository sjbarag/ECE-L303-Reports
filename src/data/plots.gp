# Gnuplot plot-generating script for ECE-L302 Lab 8
# Note that this script requires the LUA Gnuplot terminal, which is not
# distributed in all packages, and the gnuplot-lua-tikz LaTeX package to
# process it.  This can be found here:
#
# http://www.sfr-fresh.com/unix/misc/gnuplot-4.4.2.tar.gz:t/gnuplot-4.4.2/share/LaTeX/gnuplot-lua-tikz.sty
#
# Execute this script with $gnuplot plots.gp
#
# Author: Sean Barag <sjb89@drexel.edu>

set terminal tikz color solid size 4.25in,2.25in

# --- Voltage Sweep ----
set border 15
set key center right width 1 box height 1
set log x
set xrange[0.0001:5]
set yrange[0:150]
set y2range[0:55]
set y2tics auto
set title 'Free-running Oscillator: Varying Capacitor'
set xlabel 'Capacitance, $C_A$ (\si{\micro\farad})'
set ylabel 'Output Frequency, $f$ (\si{\kilo\hertz})'
set y2label 'Output Duty Cycle, (\si{\percent})'
set grid
set output "../img/plot/free_run.tex"
plot "free_run_c.txt" using 1:3 with linespoints axis x1y1 lw 3 pt 8 title '$f$', \
     "free_run_c.txt" using 1:4 with linespoints axis x1y2 lw 3 pt 5 title 'Duty Cycle'
