
`timescale 1 ns / 1 ps

	module bus_monitor_v1_0 #
	(
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 6
	)
	(
		input wire [2:0] bus_invalid,
		input wire [2:0] cpu_stop,
		output wire interrupt,
		output wire [2:0] cpu_enable_clk,
		output wire [2:0] cpu_reset,
		input wire [2:0] actual_cpu_reset,

		output wire [1:0] jtag_select,
		output wire clear_reset,
		output wire override_reset_vector,
		output wire reset_to_recovery,
		output wire [2:0] reset_routing_logic,

		input wire [31:0] cpu0_pc,
		input wire [31:0] cpu1_pc,
		input wire [31:0] cpu2_pc,

		input wire cpu_back_online,
		output wire ack_back_online,

		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);

	reg [2:0] bus_invalid_i;
	reg [2:0] interrupt_status;


    reg fault_interrupt_i;
    reg cpu_online_interrupt_i;

    wire bus_error;
    wire fault_interrupt_enable;
    wire fault_interrupt_clear;
    wire cpu_online_interrupt_enable;
    wire cpu_online_interrupt_clear;

    wire interrupt_enable;

    assign interrupt = interrupt_enable & ((fault_interrupt_i & fault_interrupt_enable) | (cpu_online_interrupt_i & cpu_online_interrupt_enable));

// Instantiation of Axi Bus Interface S00_AXI
	bus_monitor_v1_0_S00_AXI # (
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) bus_monitor_v1_0_S00_AXI_inst (

	    .fault_interrupt_clear(fault_interrupt_clear),
	    .fault_interrupt_enable(fault_interrupt_enable),
	    .fault_irq(fault_interrupt_i),
	    .online_irq(cpu_online_interrupt_i),
	    .cpu_online_interrupt_clear(cpu_online_interrupt_clear),
	    .cpu_online_interrupt_enable(cpu_online_interrupt_enable),
	    .interrupt_enable(interrupt_enable),
	    .interrupt_status(interrupt_status),
	    .cpu_enable_clk(cpu_enable_clk),
	    .cpu_stop(cpu_stop),
	    .cpu_reset(cpu_reset),
	    .actual_cpu_reset(actual_cpu_reset),
	    .jtag_select(jtag_select),
	    .clear_reset(clear_reset),
	    .override_reset_vector(override_reset_vector),
	    .reset_to_recovery(reset_to_recovery),
	    .reset_routing_logic(reset_routing_logic),
	    .cpu0_pc(cpu0_pc),
	    .cpu1_pc(cpu1_pc),
	    .cpu2_pc(cpu2_pc),
	    .ack_back_online(ack_back_online),

		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	assign bus_error = bus_invalid[0] | bus_invalid[1] | bus_invalid[2];

	always @( posedge s00_axi_aclk)
	begin
	   interrupt_status <= bus_invalid;
	end

	always @( posedge s00_axi_aclk)
	begin
	   if(s00_axi_aresetn == 1'b1)
           begin
	     if(bus_error == 1'b1)
	     begin
	         fault_interrupt_i <= 1'b1;
	     end
	     else if(fault_interrupt_clear == 1'b1)
	     begin
	         fault_interrupt_i <= 1'b0;
	     end
	     if(cpu_back_online == 1'b1)
	     begin
		cpu_online_interrupt_i <= 1'b1;
	     end
	     else if(cpu_online_interrupt_clear == 1'b1)
	     begin
		cpu_online_interrupt_i <= 1'b0;
             end
           end
	end

	endmodule
