set_property BITSTREAM.CONFIG.OVERTEMPSHUTDOWN ENABLE [current_design]

# ----------------------------------------------------------------------------------
# Important! Do not remove this constraint!
# This property ensures that all unused pins are set to high impedance.
# If the constraint is removed, all unused pins have to be set to HiZ in the top level file.
set_property BITSTREAM.CONFIG.UNUSEDPIN PULLNONE [current_design]
# ----------------------------------------------------------------------------------


#set_property PACKAGE_PIN AG4   [get_ports {uart_rtl_0_rxd}]
#set_property PACKAGE_PIN AG9   [get_ports {uart_rtl_0_txd}]

#set_property IOSTANDARD LVCMOS18 [get_ports {uart_rtl_0_rxd}]
#set_property IOSTANDARD LVCMOS18 [get_ports {uart_rtl_0_txd}]

set_property PACKAGE_PIN AE8   [get_ports {led}]
set_property IOSTANDARD LVCMOS18 [get_ports {led}]

create_generated_clock -name jtag0_tck -divide_by 1 -source [get_pins design_1_i/zynq_ultra_ps_e_0/pl_clk1] [get_pins design_1_i/jtag_simplelink_CPU0/U0/jtag_simplelink_v1_0_S00_AXI_inst/slv_reg0_reg[31]/Q]
create_generated_clock -name jtag1_tck -divide_by 1 -source [get_pins design_1_i/zynq_ultra_ps_e_0/pl_clk1] [get_pins design_1_i/jtag_simplelink_CPU1/U0/jtag_simplelink_v1_0_S00_AXI_inst/slv_reg0_reg[31]/Q]
create_generated_clock -name jtag2_tck -divide_by 1 -source [get_pins design_1_i/zynq_ultra_ps_e_0/pl_clk1] [get_pins design_1_i/jtag_simplelink_CPU2/U0/jtag_simplelink_v1_0_S00_AXI_inst/slv_reg0_reg[31]/Q]

create_generated_clock -name jtag_mux_tck -divide_by 1 -source [get_pins design_1_i/zynq_ultra_ps_e_0/pl_clk1] [get_pins design_1_i/jtag_simplelink_mux/U0/jtag_simplelink_v1_0_S00_AXI_inst/slv_reg0_reg[31]/Q]