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

# --- circuit 3 (voltage regulator) ----
unset key
set xlabel 'Input Voltage, $V_{in}$ (V)'
set ylabel 'Output Voltage, $V_{out}$ (V)'
set output "../img/circuit3.tex"
plot "circuit3.dat" using 1:2 with linespoints


# --- circuit 4 (constant current source) ----
set key bottom left
set log x
set xlabel 'Load Resistance, $R$ (\si{\kilo\ohm})'
set ylabel 'Measured Current, $I_{out}$ (\si{\milli\ampere})'
set output "../img/circuit4.tex"
plot "circuit4.dat" using 1:2 title '16V source' with linespoints,\
"circuit4.dat" using 1:3 title '32V source 'with linespoints
