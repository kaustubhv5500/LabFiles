set terminal postscript eps color enh "Times-BoldItalic"
set output "RLC Delay analysis.eps"
set title "RLC Delay Analysis Plot"
set xlabel "Time (sec)"
set ylabel "RLC Delay"
set xrange [0:5]
plot "DlRlcStats.txt" using 1:11 title "RLC Delay downlink" with lines,"UlRlcStats.txt" using 1:11 title "RLC Delay uplink" with lines
