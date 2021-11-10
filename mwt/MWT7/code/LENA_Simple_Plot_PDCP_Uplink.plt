set terminal postscript eps color enh "Times-BoldItalic"
set output "Uplink_PDCP.eps"
set title "Uplink PDCP Statistics Plot"
set xlabel "Time (sec)"
set ylabel "Bytes"
set xrange [0:5]
plot "UlPdcpStats.txt" using 1:8 title "Uplink TxBytes" with lines,"UlPdcpStats.txt" using 1:10 title "Uplink RxBytes" with lines
