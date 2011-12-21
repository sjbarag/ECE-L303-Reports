# Gnuplot plot-generating script for ECE-L302 Lab 8
# Note that this script requires the LUA Gnuplot terminal, which is not
# distributed in all packages, and the gnuplot-lua-tikz LaTeX package to
# process it.  This can be found here:
#
# http://www.sfr-fresh.com/unix/misc/gnuplot-4.4.2.tar.gz:t/gnuplot-4.4.2/share/LaTeX/gnuplot-lua-tikz.sty
#
# Execute this script with $gnuplot plots.gp
# Some of the settings have been omitted here, as they are already contained in
# my personal .gnuplotrc file.
#
# Author: Sean Barag <sjb89@drexel.edu>

set terminal tikz color solid size 4.25in,2.25in

# --- Voltage Sweep ----
set border 15
set key center left width -10 box height 1
set xrange[0:30]
set yrange[0:35]
set y2range[0:3.5]
set y2tics auto
set title 'Voltage Sweep: Output Voltage'
set xlabel 'Power Supply Voltage, $V_\mathrm{PS}$ (V)'
set ylabel 'Output Voltage, $V_\mathrm{P-P}$ (V)'
set y2label 'Output Frequency, $f$ (kHZ)'
set grid
set output "../img/plot/vSweep.tex"
plot "vSweep.dat" using 1:2 with linespoints axis x1y1 lw 3 title '$V_\mathrm{P-P}$', \
     "vSweep.dat" using 1:3 with linespoints axis x1y2 lw 3 pt 5 title '$f$'
