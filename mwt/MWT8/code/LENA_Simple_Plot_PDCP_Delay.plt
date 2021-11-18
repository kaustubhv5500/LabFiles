set terminal postscript eps color enh "Times-BoldItalic"
set output "PDCP_Delay.eps"
set title "Uplink/Downlink PDCP Delay Statistics Plot"
set xlabel "Time (sec)"
set ylabel "PDCP Delay"
set xrange [0:30]
plot "UlPdcpStats.txt" using 1:11 title "Uplink Delay" with lines,"DlPdcpStats.txt" using 1:11 title "Downlink Delay" with lines
