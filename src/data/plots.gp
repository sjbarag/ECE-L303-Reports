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

# ---- Simulated ----
set border 15
unset key
set log x
set xrange[50:10e3]
set xtics (100, 300, 1000, 3000, 10000)
set yrange[-60:0]
set ytics 10
set title 'Simulated Frequency Response of Third-order Low Pass Filter'
set xlabel 'Input Frequency, $f$ (\si{\hertz})'
set ylabel 'Output Gain, $A$, (\si{\decibel})'
set grid
set output "../img/plot/bodePlotSim.tex"
plot "bodeData.txt" using 1:2 with lines lw 3

# ---- Measured ----
set title 'Measured Frequency Response of Third-order Low Pass Filter'
set output "../img/plot/bodePlotMeas.tex"
plot "labViewData.txt" using 1:5 with lines lw 3

# ---- Calculated ----
set title 'Calculated Frequency Response of Third-order Low Pass Filter'
set output "../img/plot/bodePlotCalc.tex"
plot "matlabBodeData.txt" using 1:3 with lines lw 3

# ---- Composite ----
set key bottom left box
set title 'Composite Frequency Response of Third-order Low Pass Filter'
set output "../img/plot/bodePlotComposite.tex"
plot "bodeData.txt" using 1:2 with lines lw 2 title 'Simulated', \
	"labViewData.txt" using 1:5 with lines lw 2 title 'Measured', \
	"matlabBodeData.txt" using 1:3 with lines lw 2 title 'Calculated'

