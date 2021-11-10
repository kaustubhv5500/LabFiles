set terminal postscript eps color enh "Times-BoldItalic"
set output "UplinkSINR.eps"
set title "LTE Uplink SINR Plot"
set xlabel "Time (sec)"
set ylabel "Uplink SINR"
set xrange [0:5]
plot "UlSinrStats.txt" using 1:5 title "Uplink SINR" with lines
