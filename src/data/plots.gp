# Gnuplot plot-generating script for ECE-L302 Lab 8
# Note that this script requires the LUA Gnuplot terminal, which is not
# distributed in all packages, and the gnuplot-lua-tikz LaTeX package to
# process it.  This can be found here:
#
# http://www.sfr-fresh.com/unix/misc/gnuplot-4.4.2.tar.gz:t/gnuplot-4.4.2/share/LaTeX/gnuplot-lua-tikz.sty 
# 
# Note also that you must have already run the dataManipulation.sh and
# powerCalcs.m scripts in Bash and MATLAB and copied the resulting data from
# MATLAB back into the appropriate files prior to executing this script with
# $gnuplot plots.gp
# Some of the settings have been omitted here, as they are already contained in
# my person .gnuplotrc file.
#
# Author: Sean Barag <sjb89@drexel.edu>

set terminal tikz color solid size 5in,2.25in
set key right outside center spacing 1.2
set rmargin 17.5
set xtics 6

# --- magNumR ----
set xlabel "Number of Bulbs"
set ylabel "$|V_R|$, $|V_S|$ (V)"
set title "Resistive Load: $|V_R|$ and $|V_S|$ vs. Number of Lightbulbs"
set ytics 20
set output "../images/magNumR.tex"
plot "R.dat" using 1:2 title  '$|V_{S,A}|$' with linespoints, \
     "R.dat" using 1:3 title  '$|V_{S,B}|$' with linespoints, \
     "R.dat" using 1:4 title  '$|V_{S,C}|$' with linespoints, \
     "R.dat" using 1:14 title '$|V_{R,A}|$' with linespoints, \
     "R.dat" using 1:15 title '$|V_{R,B}|$' with linespoints, \
     "R.dat" using 1:16 title '$|V_{R,C}|$' with linespoints

# --- angNumR ---
# xlabel is the same
set ylabel '$\angle V_R$, $\angle V_S$ (\si{\degree})'
set title 'Resistive Load: $\angle V_R$ and $\angle V_S$ vs. Number of Lightbulbs'
set ytics 50
set output "../images/angNumR.tex"
plot "R.dat" using 1:5 title  '$\angle V_{S,A}$' with linespoints, \
     "R.dat" using 1:6 title  '$\angle V_{S,B}$' with linespoints, \
     "R.dat" using 1:7 title  '$\angle V_{S,C}$' with linespoints, \
     "R.dat" using 1:17 title '$\angle V_{R,A}$' with linespoints, \
     "R.dat" using 1:18 title '$\angle V_{R,B}$' with linespoints, \
     "R.dat" using 1:19 title '$\angle V_{R,C}$' with linespoints

# --- magRealR ---
set xlabel "Real Power (W)"
set ylabel '$|V_R|$ (V)'
set title  'Resistive Load: $|V_R|$ vs. Real Power'
set xtics auto
set ytics auto
set output "../images/magRealR.tex"
plot "R.dat" using 26:14 title 'A Phase' with linespoints, \
     "R.dat" using 27:15 title 'B Phase' with linespoints, \
     "R.dat" using 28:16 title 'C Phase' with linespoints

# --- magReactiveR ---
set xlabel "Reactive Power (Var)"
# ylabel is the same
set title  'Resistive Load: $|V_R|$ vs. Reactive Power'
set xtics auto
set ytics auto
set output "../images/magReactiveR.tex"
plot "R.dat" using 29:14 title 'A Phase' with linespoints, \
     "R.dat" using 30:15 title 'B Phase' with linespoints, \
     "R.dat" using 31:16 title 'C Phase' with linespoints


set xtics 3
# --- magNumRL ---
set xlabel "Number of Inductors"
set ylabel "$|V_R|$, $|V_S|$ (V)"
set title "Inductive Load: $|V_R|$ and $|V_S|$ vs. Number of Inductors"
set output "../images/magNumRL.tex"
set ytics 20
plot "RL.dat" using 1:2 title  '$|V_{S,A}|$' with linespoints, \
     "RL.dat" using 1:3 title  '$|V_{S,B}|$' with linespoints, \
     "RL.dat" using 1:4 title  '$|V_{S,C}|$' with linespoints, \
     "RL.dat" using 1:14 title '$|V_{R,A}|$' with linespoints, \
     "RL.dat" using 1:15 title '$|V_{R,B}|$' with linespoints, \
     "RL.dat" using 1:16 title '$|V_{R,C}|$' with linespoints

# --- angNumRL ---
# xlabel is the same
set ylabel '$\angle V_R$, $\angle V_S$ (\si{\degree})'
set title 'Inductive Load: $\angle V_R$ and $\angle V_S$ vs. Number of Inductors'
set output "../images/angNumRL.tex"
set ytics 50
plot "RL.dat" using 1:5 title  '$\angle V_{S,A}$' with linespoints, \
     "RL.dat" using 1:6 title  '$\angle V_{S,B}$' with linespoints, \
     "RL.dat" using 1:7 title  '$\angle V_{S,C}$' with linespoints, \
     "RL.dat" using 1:17 title '$\angle V_{R,A}$' with linespoints, \
     "RL.dat" using 1:18 title '$\angle V_{R,B}$' with linespoints, \
     "RL.dat" using 1:19 title '$\angle V_{R,C}$' with linespoints

# --- magRealRL ---
set xlabel "Real Power (W)"
set ylabel '$|V_R|$ (V)'
set title  'Inductive Load: $|V_R|$ vs. Real Power'
set xtics auto
set ytics auto
set output "../images/magRealRL.tex"
plot "RL.dat" using 26:14 title 'A Phase' with linespoints, \
     "RL.dat" using 27:15 title 'B Phase' with linespoints, \
     "RL.dat" using 28:16 title 'C Phase' with linespoints

# --- magReactiveRL ---
set xlabel "Reactive Power (Var)"
# ylabel is the same
set title  'Inductive Load: $|V_R|$ vs. Reactive Power'
set xtics auto
set ytics auto
set output "../images/magReactiveRL.tex"
plot "RL.dat" using 29:14 title 'A Phase' with linespoints, \
     "RL.dat" using 30:15 title 'B Phase' with linespoints, \
     "RL.dat" using 31:16 title 'C Phase' with linespoints



# --- magNumRC ---
set xlabel "Number of Capacitors"
set ylabel "$|V_R|$, $|V_S|$ (V)"
set title "Capacitive Load: $|V_R|$ and $|V_S|$ vs. Number of Capacitors"
set output "../images/magNumRC.tex"
set ytics 20
plot "RC.dat" using 1:2 title  '$|V_{S,A}|$' with linespoints, \
     "RC.dat" using 1:3 title  '$|V_{S,B}|$' with linespoints, \
     "RC.dat" using 1:4 title  '$|V_{S,C}|$' with linespoints, \
     "RC.dat" using 1:14 title '$|V_{R,A}|$' with linespoints, \
     "RC.dat" using 1:15 title '$|V_{R,B}|$' with linespoints, \
     "RC.dat" using 1:16 title '$|V_{R,C}|$' with linespoints

# --- angNumRC ---
# xlabel is the same
set ylabel '$\angle V_R$, $\angle V_S$ (\si{\degree})'
set title 'Capacitive Load: $\angle V_R$ and $\angle V_S$ vs. Number of Capacitors'
set output "../images/angNumRC.tex"
set ytics 50
plot "RC.dat" using 1:5 title  '$\angle V_{S,A}$' with linespoints, \
     "RC.dat" using 1:6 title  '$\angle V_{S,B}$' with linespoints, \
     "RC.dat" using 1:7 title  '$\angle V_{S,C}$' with linespoints, \
     "RC.dat" using 1:17 title '$\angle V_{R,A}$' with linespoints, \
     "RC.dat" using 1:18 title '$\angle V_{R,B}$' with linespoints, \
     "RC.dat" using 1:19 title '$\angle V_{R,C}$' with linespoints

# --- magRealRC ---
set xlabel "Real Power (W)"
set ylabel '$|V_R|$ (V)'
set title  'Capacitive Load: $|V_R|$ vs. Real Power'
set xtics auto
set ytics auto
set output "../images/magRealRC.tex"
plot "RC.dat" using 26:14 title 'A Phase' with linespoints, \
     "RC.dat" using 27:15 title 'B Phase' with linespoints, \
     "RC.dat" using 28:16 title 'C Phase' with linespoints

# --- magReactiveRC ---
set xlabel "Reactive Power (Var)"
# ylabel is the same
set title  'Capacitive Load: $|V_R|$ vs. Reactive Power'
set xtics auto
set ytics auto
set output "../images/magReactiveRC.tex"
plot "RC.dat" using 29:14 title 'A Phase' with linespoints, \
     "RC.dat" using 30:15 title 'B Phase' with linespoints, \
     "RC.dat" using 31:16 title 'C Phase' with linespoints
