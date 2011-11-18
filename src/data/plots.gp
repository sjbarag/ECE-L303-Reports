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

# ---- Varying C ----
set border 15
set key center right width 1 box height 1
set log x
set xrange[0.0001:5]
set yrange[0:150]
set ytics 30
set y2range[0:60]
set y2tics 12
set title 'Free-running Oscillator: Varying Capacitor'
set xlabel 'Capacitance, $C_T$ (\si{\micro\farad})'
set ylabel 'Output Frequency, $f$ (\si{\kilo\hertz})'
set y2label 'Output Duty Cycle, (\si{\percent})'
set grid
set output "../img/plot/free_run_c.tex"
plot "free_run_c.txt" using 1:3 with linespoints axis x1y1 lw 3 pt 8 title '$f$', \
     "free_run_c.txt" using 1:4 with linespoints axis x1y2 lw 3 pt 5 title 'Duty Cycle'

# ---- Varying R ----
set key top left width 1 box height 1
unset log x
set xrange[0:20]
set xtics 2
set yrange[0:16]
set ytics 2
set y2range[0:80]
set y2tics auto
set title 'Free-running Oscillator: Varying Resistor'
set xlabel 'Resistance, $R_A$ (\si{\kilo\ohm})'
set ylabel 'Output Frequency, $f$ (\si{\kilo\hertz})'
set y2label 'Output Duty Cycle, (\si{\percent})'
set grid
set output "../img/plot/free_run_r.tex"
plot "free_run_r.txt" using 1:3 with linespoints axis x1y1 lw 3 pt 8 title '$f$', \
     "free_run_r.txt" using 1:4 with linespoints axis x1y2 lw 3 pt 5 title 'Duty Cycle'

# ---- DC sweep ----
unset key
set xrange[0:8]
set yrange[0:15]
set xtics auto
set ytics 3
unset y2range
unset y2tics
unset y2label
set grid
set title 'DC Sweep'
set xlabel 'Input Voltage, $V+$ (\si{\volt})'
set ylabel 'Output Frequency, $f$ (\si{\kilo\hertz})'
set grid
set output "../img/plot/dc_sweep.tex"
plot "dc_sweep.txt" using 1:2 with linespoints lw 3

# ---- freq mod ----
set key center right width -33 box
set xrange[0:3]
set yrange[0:25]
set xtics auto
set ytics 5
unset y2range
unset y2tics
unset y2label
set grid
set title 'Frequency Modulation'
set xlabel 'Input Frequency, $f$ (\si{\hertz})'
set ylabel 'Output Period, $\Delta t$ (\si{\micro\second})'
set grid
set output "../img/plot/freq_mod.tex"
plot "freq_mod.txt" index 0 using 1:2 with linespoints pt 8 lw 3 title '$\SI{1}{\volt}_\text{\footnotesize P-P}$',\
	 "freq_mod.txt" index 1 using 1:2 with linespoints pt 7 lw 3 title '$\SI{2}{\volt}_\text{\footnotesize P-P}$',\
	 "freq_mod.txt" index 2 using 1:2 with linespoints pt 5 lw 3 title '$\SI{3}{\volt}_\text{\footnotesize P-P}$'
