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

# --- line regulation (regulator only) ----
set border 15
unset key
set xrange[0:30]
set yrange[0:8.5]
set title 'Line Regulation: Voltage Regulator Only'
set xlabel 'Input Voltage, $V_\text{in}$ (V)'
set ylabel 'Output Voltage, $V_\text{out}$ (V)'
set grid
set output "../img/plot/vrLineReg.tex"
plot "vrLineReg.dat" using 1:3 with linespoints lw 3

# --- load regulation (regulator only) ---
set autoscale x
set log x
set yrange [8.025:8.07]
set title 'Load Regulation: Voltage Regulator Only'
set xlabel 'Load Current, $I_\text{L}$ (A)'
set ylabel 'Output Voltage, $V_\text{out}$ (V)'
set grid mxtics xtics ytics
set output "../img/plot/vrLoadReg.tex"
plot "vrLoadReg.dat" using 3:2 with linespoints lw 3


# --- load regulation (regulator + rectifier) ----
set log x
set title 'Load Regulation: Voltage Regulator with AC Rectifier'
set xlabel 'Load Current, $I_\text{L}$ (A)'
set ylabel 'Output Voltage, $V_\text{out}$ (V)'
set grid mxtics xtics ytics
set output "../img/plot/fullLoadReg.tex"
plot "fullLoadReg.dat" using 3:2 with linespoints lw 3
