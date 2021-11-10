set terminal postscript eps color enh "Times-BoldItalic"
set output "MACStats.eps"
set title "MAC Layer Statistics Plot"
set xlabel "Time (sec)"
set ylabel "Size"
set xrange [0:5]
plot "UlTxPhyStats.txt" using ($1/1000):($7) title "Uplink Size" with lines,"DlRxPhyStats.txt" using ($1/1000):($8) title "Downlink Size" with lines
