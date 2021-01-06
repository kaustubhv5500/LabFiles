# -*- coding: utf-8 -*-
##################################################
# GNU Radio Python Flow Graph
# Title: Eyeplot
# GNU Radio version: 3.7.13.5
##################################################

from PyQt4 import Qt
from gnuradio import blocks
from gnuradio import gr
from gnuradio import qtgui
from gnuradio.filter import firdes
import sip


class eyeplot(gr.hier_block2, Qt.QWidget):

    def __init__(self, td=40):
        gr.hier_block2.__init__(
            self, "Eyeplot",
            gr.io_signature(1, 1, gr.sizeof_float*1),
            gr.io_signature(0, 0, 0),
        )

        Qt.QWidget.__init__(self)
        self.top_layout = Qt.QVBoxLayout()
        self.top_grid_layout = Qt.QGridLayout()
        self.top_layout.addLayout(self.top_grid_layout)
        self.setLayout(self.top_layout)

        ##################################################
        # Parameters
        ##################################################
        self.td = td

        ##################################################
        # Variables
        ##################################################
        self.samp_rate = samp_rate = 32000

        ##################################################
        # Blocks
        ##################################################
        self.qtgui_time_sink_x_0 = qtgui.time_sink_f(
        	80, #size
        	samp_rate, #samp_rate
        	"", #name
        	10 #number of inputs
        )
        self.qtgui_time_sink_x_0.set_update_time(0.10)
        self.qtgui_time_sink_x_0.set_y_axis(-1, 1)

        self.qtgui_time_sink_x_0.set_y_label('Amplitude', "")

        self.qtgui_time_sink_x_0.enable_tags(-1, True)
        self.qtgui_time_sink_x_0.set_trigger_mode(qtgui.TRIG_MODE_FREE, qtgui.TRIG_SLOPE_POS, 0.0, 0, 0, "")
        self.qtgui_time_sink_x_0.enable_autoscale(False)
        self.qtgui_time_sink_x_0.enable_grid(False)
        self.qtgui_time_sink_x_0.enable_axis_labels(True)
        self.qtgui_time_sink_x_0.enable_control_panel(False)
        self.qtgui_time_sink_x_0.enable_stem_plot(False)

        if not True:
          self.qtgui_time_sink_x_0.disable_legend()

        labels = ['', '', '', '', '',
                  '', '', '', '', '']
        widths = [1, 1, 1, 1, 1,
                  1, 1, 1, 1, 1]
        colors = ["blue", "red", "green", "black", "cyan",
                  "magenta", "yellow", "dark red", "dark green", "blue"]
        styles = [1, 1, 1, 1, 1,
                  1, 1, 1, 1, 1]
        markers = [-1, -1, -1, -1, -1,
                   -1, -1, -1, -1, -1]
        alphas = [1.0, 1.0, 1.0, 1.0, 1.0,
                  1.0, 1.0, 1.0, 1.0, 1.0]

        for i in xrange(10):
            if len(labels[i]) == 0:
                self.qtgui_time_sink_x_0.set_line_label(i, "Data {0}".format(i))
            else:
                self.qtgui_time_sink_x_0.set_line_label(i, labels[i])
            self.qtgui_time_sink_x_0.set_line_width(i, widths[i])
            self.qtgui_time_sink_x_0.set_line_color(i, colors[i])
            self.qtgui_time_sink_x_0.set_line_style(i, styles[i])
            self.qtgui_time_sink_x_0.set_line_marker(i, markers[i])
            self.qtgui_time_sink_x_0.set_line_alpha(i, alphas[i])

        self._qtgui_time_sink_x_0_win = sip.wrapinstance(self.qtgui_time_sink_x_0.pyqwidget(), Qt.QWidget)
        self.top_grid_layout.addWidget(self._qtgui_time_sink_x_0_win)
        self.blocks_delay_8 = blocks.delay(gr.sizeof_float*1, 40)
        self.blocks_delay_7 = blocks.delay(gr.sizeof_float*1, 360)
        self.blocks_delay_6 = blocks.delay(gr.sizeof_float*1, 320)
        self.blocks_delay_5 = blocks.delay(gr.sizeof_float*1, 240)
        self.blocks_delay_4 = blocks.delay(gr.sizeof_float*1, 200)
        self.blocks_delay_3 = blocks.delay(gr.sizeof_float*1, 120)
        self.blocks_delay_2 = blocks.delay(gr.sizeof_float*1, 80)
        self.blocks_delay_1 = blocks.delay(gr.sizeof_float*1, 160)
        self.blocks_delay_0 = blocks.delay(gr.sizeof_float*1, 280)



        ##################################################
        # Connections
        ##################################################
        self.connect((self.blocks_delay_0, 0), (self.qtgui_time_sink_x_0, 7))
        self.connect((self.blocks_delay_1, 0), (self.qtgui_time_sink_x_0, 4))
        self.connect((self.blocks_delay_2, 0), (self.qtgui_time_sink_x_0, 2))
        self.connect((self.blocks_delay_3, 0), (self.qtgui_time_sink_x_0, 3))
        self.connect((self.blocks_delay_4, 0), (self.qtgui_time_sink_x_0, 5))
        self.connect((self.blocks_delay_5, 0), (self.qtgui_time_sink_x_0, 6))
        self.connect((self.blocks_delay_6, 0), (self.qtgui_time_sink_x_0, 8))
        self.connect((self.blocks_delay_7, 0), (self.qtgui_time_sink_x_0, 9))
        self.connect((self.blocks_delay_8, 0), (self.qtgui_time_sink_x_0, 1))
        self.connect((self, 0), (self.blocks_delay_0, 0))
        self.connect((self, 0), (self.blocks_delay_1, 0))
        self.connect((self, 0), (self.blocks_delay_2, 0))
        self.connect((self, 0), (self.blocks_delay_3, 0))
        self.connect((self, 0), (self.blocks_delay_4, 0))
        self.connect((self, 0), (self.blocks_delay_5, 0))
        self.connect((self, 0), (self.blocks_delay_6, 0))
        self.connect((self, 0), (self.blocks_delay_7, 0))
        self.connect((self, 0), (self.blocks_delay_8, 0))
        self.connect((self, 0), (self.qtgui_time_sink_x_0, 0))

    def get_td(self):
        return self.td

    def set_td(self, td):
        self.td = td

    def get_samp_rate(self):
        return self.samp_rate

    def set_samp_rate(self, samp_rate):
        self.samp_rate = samp_rate
        self.qtgui_time_sink_x_0.set_samp_rate(self.samp_rate)
