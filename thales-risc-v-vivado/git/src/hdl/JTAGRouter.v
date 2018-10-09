module JTAGRouter( // @[:@30.2]
  input        clock, // @[:@31.4]
  input        reset, // @[:@32.4]
  output       io_cpu_jtag_0_TCK, // @[:@33.4]
  output       io_cpu_jtag_0_TMS, // @[:@33.4]
  output       io_cpu_jtag_0_TDI, // @[:@33.4]
  input        io_cpu_jtag_0_TDO_data, // @[:@33.4]
  input        io_cpu_jtag_0_TDO_driven, // @[:@33.4]
  output       io_cpu_jtag_1_TCK, // @[:@33.4]
  output       io_cpu_jtag_1_TMS, // @[:@33.4]
  output       io_cpu_jtag_1_TDI, // @[:@33.4]
  input        io_cpu_jtag_1_TDO_data, // @[:@33.4]
  input        io_cpu_jtag_1_TDO_driven, // @[:@33.4]
  output       io_cpu_jtag_2_TCK, // @[:@33.4]
  output       io_cpu_jtag_2_TMS, // @[:@33.4]
  output       io_cpu_jtag_2_TDI, // @[:@33.4]
  input        io_cpu_jtag_2_TDO_data, // @[:@33.4]
  input        io_cpu_jtag_2_TDO_driven, // @[:@33.4]
  input        io_input_jtag_0_TCK, // @[:@33.4]
  input        io_input_jtag_0_TMS, // @[:@33.4]
  input        io_input_jtag_0_TDI, // @[:@33.4]
  output       io_input_jtag_0_TDO_data, // @[:@33.4]
  output       io_input_jtag_0_TDO_driven, // @[:@33.4]
  input        io_input_jtag_1_TCK, // @[:@33.4]
  input        io_input_jtag_1_TMS, // @[:@33.4]
  input        io_input_jtag_1_TDI, // @[:@33.4]
  output       io_input_jtag_1_TDO_data, // @[:@33.4]
  output       io_input_jtag_1_TDO_driven, // @[:@33.4]
  input  [1:0] io_selector // @[:@33.4]
);
  wire  BUFGMUX_CTRL_S; // @[JTAGRouter.scala 19:21:@37.4]
  wire  BUFGMUX_CTRL_I1; // @[JTAGRouter.scala 19:21:@37.4]
  wire  BUFGMUX_CTRL_I0; // @[JTAGRouter.scala 19:21:@37.4]
  wire  BUFGMUX_CTRL_O; // @[JTAGRouter.scala 19:21:@37.4]
  wire  BUFGMUX_CTRL_1_S; // @[JTAGRouter.scala 19:21:@46.4]
  wire  BUFGMUX_CTRL_1_I1; // @[JTAGRouter.scala 19:21:@46.4]
  wire  BUFGMUX_CTRL_1_I0; // @[JTAGRouter.scala 19:21:@46.4]
  wire  BUFGMUX_CTRL_1_O; // @[JTAGRouter.scala 19:21:@46.4]
  wire  BUFGMUX_CTRL_2_S; // @[JTAGRouter.scala 19:21:@55.4]
  wire  BUFGMUX_CTRL_2_I1; // @[JTAGRouter.scala 19:21:@55.4]
  wire  BUFGMUX_CTRL_2_I0; // @[JTAGRouter.scala 19:21:@55.4]
  wire  BUFGMUX_CTRL_2_O; // @[JTAGRouter.scala 19:21:@55.4]
  wire  _T_113; // @[JTAGRouter.scala 56:20:@67.4]
  wire  _T_114; // @[JTAGRouter.scala 65:66:@73.6]
  wire  _T_115; // @[JTAGRouter.scala 66:70:@75.6]
  wire  _T_119; // @[JTAGRouter.scala 81:26:@86.6]
  wire  _T_120; // @[JTAGRouter.scala 90:66:@92.8]
  wire  _T_121; // @[JTAGRouter.scala 91:70:@94.8]
  wire  _T_125; // @[JTAGRouter.scala 105:26:@105.8]
  wire  _T_126; // @[JTAGRouter.scala 114:66:@111.10]
  wire  _T_127; // @[JTAGRouter.scala 115:70:@113.10]
  wire  _T_139; // @[JTAGRouter.scala 142:65:@137.10]
  wire  _T_143; // @[JTAGRouter.scala 143:67:@140.10]
  wire  _GEN_0; // @[JTAGRouter.scala 105:45:@106.8]
  wire  _GEN_1; // @[JTAGRouter.scala 105:45:@106.8]
  wire  _GEN_2; // @[JTAGRouter.scala 105:45:@106.8]
  wire  _GEN_3; // @[JTAGRouter.scala 105:45:@106.8]
  wire  _GEN_8; // @[JTAGRouter.scala 105:45:@106.8]
  wire  _GEN_9; // @[JTAGRouter.scala 105:45:@106.8]
  wire  _GEN_10; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_11; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_12; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_13; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_14; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_15; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_16; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_17; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_19; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_20; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_21; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_22; // @[JTAGRouter.scala 81:45:@87.6]
  wire  _GEN_23; // @[JTAGRouter.scala 56:39:@68.4]
  wire  _GEN_24; // @[JTAGRouter.scala 56:39:@68.4]
  wire  _GEN_25; // @[JTAGRouter.scala 56:39:@68.4]
  wire  _GEN_26; // @[JTAGRouter.scala 56:39:@68.4]
  wire  _GEN_27; // @[JTAGRouter.scala 56:39:@68.4]
  wire  _GEN_28; // @[JTAGRouter.scala 56:39:@68.4]
  wire  tck_sel_0; // @[JTAGRouter.scala 56:39:@68.4]
  wire  tck_sel_1; // @[JTAGRouter.scala 56:39:@68.4]
  wire  tck_sel_2; // @[JTAGRouter.scala 56:39:@68.4]
  wire  _GEN_32; // @[JTAGRouter.scala 56:39:@68.4]
  wire  _GEN_33; // @[JTAGRouter.scala 56:39:@68.4]
  wire  _GEN_34; // @[JTAGRouter.scala 56:39:@68.4]
  wire  _GEN_35; // @[JTAGRouter.scala 56:39:@68.4]
  wire  jtag_tck_0; // @[JTAGRouter.scala 43:22:@35.4]
  wire  jtag_tck_1; // @[JTAGRouter.scala 43:22:@35.4]
  wire  jtag_tck_2; // @[JTAGRouter.scala 43:22:@35.4]
  BUFGMUX_CTRL BUFGMUX_CTRL ( // @[JTAGRouter.scala 19:21:@37.4]
    .S(BUFGMUX_CTRL_S),
    .I1(BUFGMUX_CTRL_I1),
    .I0(BUFGMUX_CTRL_I0),
    .O(BUFGMUX_CTRL_O)
  );
  BUFGMUX_CTRL BUFGMUX_CTRL_1 ( // @[JTAGRouter.scala 19:21:@46.4]
    .S(BUFGMUX_CTRL_1_S),
    .I1(BUFGMUX_CTRL_1_I1),
    .I0(BUFGMUX_CTRL_1_I0),
    .O(BUFGMUX_CTRL_1_O)
  );
  BUFGMUX_CTRL BUFGMUX_CTRL_2 ( // @[JTAGRouter.scala 19:21:@55.4]
    .S(BUFGMUX_CTRL_2_S),
    .I1(BUFGMUX_CTRL_2_I1),
    .I0(BUFGMUX_CTRL_2_I0),
    .O(BUFGMUX_CTRL_2_O)
  );
  assign _T_113 = io_selector == 2'h1; // @[JTAGRouter.scala 56:20:@67.4]
  assign _T_114 = io_cpu_jtag_1_TDO_data | io_cpu_jtag_2_TDO_data; // @[JTAGRouter.scala 65:66:@73.6]
  assign _T_115 = io_cpu_jtag_1_TDO_driven | io_cpu_jtag_2_TDO_driven; // @[JTAGRouter.scala 66:70:@75.6]
  assign _T_119 = io_selector == 2'h2; // @[JTAGRouter.scala 81:26:@86.6]
  assign _T_120 = io_cpu_jtag_0_TDO_data | io_cpu_jtag_2_TDO_data; // @[JTAGRouter.scala 90:66:@92.8]
  assign _T_121 = io_cpu_jtag_0_TDO_driven | io_cpu_jtag_2_TDO_driven; // @[JTAGRouter.scala 91:70:@94.8]
  assign _T_125 = io_selector == 2'h3; // @[JTAGRouter.scala 105:26:@105.8]
  assign _T_126 = io_cpu_jtag_0_TDO_data | io_cpu_jtag_1_TDO_data; // @[JTAGRouter.scala 114:66:@111.10]
  assign _T_127 = io_cpu_jtag_0_TDO_driven | io_cpu_jtag_1_TDO_driven; // @[JTAGRouter.scala 115:70:@113.10]
  assign _T_139 = _T_126 | io_cpu_jtag_2_TDO_data; // @[JTAGRouter.scala 142:65:@137.10]
  assign _T_143 = _T_127 | io_cpu_jtag_2_TDO_driven; // @[JTAGRouter.scala 143:67:@140.10]
  assign _GEN_0 = _T_125 ? io_input_jtag_1_TDI : io_input_jtag_0_TDI; // @[JTAGRouter.scala 105:45:@106.8]
  assign _GEN_1 = _T_125 ? io_input_jtag_1_TMS : io_input_jtag_0_TMS; // @[JTAGRouter.scala 105:45:@106.8]
  assign _GEN_2 = _T_125 ? _T_126 : 1'h0; // @[JTAGRouter.scala 105:45:@106.8]
  assign _GEN_3 = _T_125 ? _T_127 : 1'h0; // @[JTAGRouter.scala 105:45:@106.8]
  assign _GEN_8 = _T_125 ? io_cpu_jtag_2_TDO_data : _T_139; // @[JTAGRouter.scala 105:45:@106.8]
  assign _GEN_9 = _T_125 ? io_cpu_jtag_2_TDO_driven : _T_143; // @[JTAGRouter.scala 105:45:@106.8]
  assign _GEN_10 = _T_119 ? io_input_jtag_1_TDI : _GEN_0; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_11 = _T_119 ? io_input_jtag_1_TMS : _GEN_1; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_12 = _T_119 ? io_input_jtag_1_TDI : io_input_jtag_0_TDI; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_13 = _T_119 ? io_input_jtag_1_TMS : io_input_jtag_0_TMS; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_14 = _T_119 ? _T_120 : _GEN_2; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_15 = _T_119 ? _T_121 : _GEN_3; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_16 = _T_119 ? 1'h1 : _T_125; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_17 = _T_119 ? 1'h0 : _T_125; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_19 = _T_119 ? io_input_jtag_0_TDI : _GEN_0; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_20 = _T_119 ? io_input_jtag_0_TMS : _GEN_1; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_21 = _T_119 ? io_cpu_jtag_1_TDO_data : _GEN_8; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_22 = _T_119 ? io_cpu_jtag_1_TDO_driven : _GEN_9; // @[JTAGRouter.scala 81:45:@87.6]
  assign _GEN_23 = _T_113 ? io_input_jtag_1_TDI : _GEN_19; // @[JTAGRouter.scala 56:39:@68.4]
  assign _GEN_24 = _T_113 ? io_input_jtag_1_TMS : _GEN_20; // @[JTAGRouter.scala 56:39:@68.4]
  assign _GEN_25 = _T_113 ? io_input_jtag_1_TDI : _GEN_12; // @[JTAGRouter.scala 56:39:@68.4]
  assign _GEN_26 = _T_113 ? io_input_jtag_1_TMS : _GEN_13; // @[JTAGRouter.scala 56:39:@68.4]
  assign _GEN_27 = _T_113 ? _T_114 : _GEN_14; // @[JTAGRouter.scala 56:39:@68.4]
  assign _GEN_28 = _T_113 ? _T_115 : _GEN_15; // @[JTAGRouter.scala 56:39:@68.4]
  assign tck_sel_0 = _T_113 ? 1'h0 : _GEN_16; // @[JTAGRouter.scala 56:39:@68.4]
  assign tck_sel_1 = _T_113 ? 1'h1 : _GEN_17; // @[JTAGRouter.scala 56:39:@68.4]
  assign tck_sel_2 = _T_113 ? 1'h1 : _T_119; // @[JTAGRouter.scala 56:39:@68.4]
  assign _GEN_32 = _T_113 ? io_input_jtag_0_TDI : _GEN_10; // @[JTAGRouter.scala 56:39:@68.4]
  assign _GEN_33 = _T_113 ? io_input_jtag_0_TMS : _GEN_11; // @[JTAGRouter.scala 56:39:@68.4]
  assign _GEN_34 = _T_113 ? io_cpu_jtag_0_TDO_data : _GEN_21; // @[JTAGRouter.scala 56:39:@68.4]
  assign _GEN_35 = _T_113 ? io_cpu_jtag_0_TDO_driven : _GEN_22; // @[JTAGRouter.scala 56:39:@68.4]
  assign jtag_tck_0 = BUFGMUX_CTRL_O; // @[JTAGRouter.scala 43:22:@35.4]
  assign jtag_tck_1 = BUFGMUX_CTRL_1_O; // @[JTAGRouter.scala 43:22:@35.4]
  assign jtag_tck_2 = BUFGMUX_CTRL_2_O; // @[JTAGRouter.scala 43:22:@35.4]
  assign io_cpu_jtag_0_TCK = jtag_tck_0;
  assign io_cpu_jtag_0_TMS = _GEN_33;
  assign io_cpu_jtag_0_TDI = _GEN_32;
  assign io_cpu_jtag_1_TCK = jtag_tck_1;
  assign io_cpu_jtag_1_TMS = _GEN_24;
  assign io_cpu_jtag_1_TDI = _GEN_23;
  assign io_cpu_jtag_2_TCK = jtag_tck_2;
  assign io_cpu_jtag_2_TMS = _GEN_26;
  assign io_cpu_jtag_2_TDI = _GEN_25;
  assign io_input_jtag_0_TDO_data = _GEN_34;
  assign io_input_jtag_0_TDO_driven = _GEN_35;
  assign io_input_jtag_1_TDO_data = _GEN_27;
  assign io_input_jtag_1_TDO_driven = _GEN_28;
  assign BUFGMUX_CTRL_S = tck_sel_0;
  assign BUFGMUX_CTRL_I1 = io_input_jtag_1_TCK;
  assign BUFGMUX_CTRL_I0 = io_input_jtag_0_TCK;
  assign BUFGMUX_CTRL_1_S = tck_sel_1;
  assign BUFGMUX_CTRL_1_I1 = io_input_jtag_1_TCK;
  assign BUFGMUX_CTRL_1_I0 = io_input_jtag_0_TCK;
  assign BUFGMUX_CTRL_2_S = tck_sel_2;
  assign BUFGMUX_CTRL_2_I1 = io_input_jtag_1_TCK;
  assign BUFGMUX_CTRL_2_I0 = io_input_jtag_0_TCK;
endmodule
