set terminal postscript eps color enh "Times-BoldItalic"
set output "DownlinkSINR.eps"
set title "LTE Downlink SINR Plot"
set xlabel "Time (sec)"
set ylabel "Downlink SINR"
set xrange [0:30]
plot "DlRsrpSinrStats.txt" using 1:6 title "Downlink SINR" with lines
