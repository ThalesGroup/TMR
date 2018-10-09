

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "fault-detector" "NUM_INSTANCES" "DEVICE_ID"  "C_CPU0_AXI_BASEADDR" "C_CPU0_AXI_HIGHADDR" "C_CPU1_AXI_BASEADDR" "C_CPU1_AXI_HIGHADDR" "C_CPU2_AXI_BASEADDR" "C_CPU2_AXI_HIGHADDR"
}
