set terminal postscript eps color enh "Times-BoldItalic"
set output "Downlink_PDCP.eps"
set title "Downlink PDCP Statistics Plot"
set xlabel "Time (sec)"
set ylabel "Bytes"
set xrange [0:30]
plot "DlPdcpStats.txt" using 1:8 title "Downlink TxBytes" with lines,"DlPdcpStats.txt" using 1:10 title "Downlink RxBytes" with lines
