library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axi_full_reg_reader_v1_0 is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line


		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_ID_WIDTH	: integer	:= 1;
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 9;
		C_S00_AXI_AWUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_ARUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_WUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_RUSER_WIDTH	: integer	:= 0;
		C_S00_AXI_BUSER_WIDTH	: integer	:= 0
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line


		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awid	: in std_logic_vector(C_S00_AXI_ID_WIDTH-1 downto 0);
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awlen	: in std_logic_vector(7 downto 0);
		s00_axi_awsize	: in std_logic_vector(2 downto 0);
		s00_axi_awburst	: in std_logic_vector(1 downto 0);
		s00_axi_awlock	: in std_logic;
		s00_axi_awcache	: in std_logic_vector(3 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awqos	: in std_logic_vector(3 downto 0);
		s00_axi_awregion	: in std_logic_vector(3 downto 0);
		s00_axi_awuser	: in std_logic_vector(C_S00_AXI_AWUSER_WIDTH-1 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wlast	: in std_logic;
		s00_axi_wuser	: in std_logic_vector(C_S00_AXI_WUSER_WIDTH-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bid	: out std_logic_vector(C_S00_AXI_ID_WIDTH-1 downto 0);
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_buser	: out std_logic_vector(C_S00_AXI_BUSER_WIDTH-1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_arid	: in std_logic_vector(C_S00_AXI_ID_WIDTH-1 downto 0);
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arlen	: in std_logic_vector(7 downto 0);
		s00_axi_arsize	: in std_logic_vector(2 downto 0);
		s00_axi_arburst	: in std_logic_vector(1 downto 0);
		s00_axi_arlock	: in std_logic;
		s00_axi_arcache	: in std_logic_vector(3 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arqos	: in std_logic_vector(3 downto 0);
		s00_axi_arregion	: in std_logic_vector(3 downto 0);
		s00_axi_aruser	: in std_logic_vector(C_S00_AXI_ARUSER_WIDTH-1 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rid	: out std_logic_vector(C_S00_AXI_ID_WIDTH-1 downto 0);
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rlast	: out std_logic;
		s00_axi_ruser	: out std_logic_vector(C_S00_AXI_RUSER_WIDTH-1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic;
		ra_reg : in std_logic_vector(31 downto 0);
		sp_reg : in std_logic_vector(31 downto 0);
		gp_reg : in std_logic_vector(31 downto 0);
		tp_reg : in std_logic_vector(31 downto 0);
		t0_reg : in std_logic_vector(31 downto 0);
		t1_reg : in std_logic_vector(31 downto 0);
		t2_reg : in std_logic_vector(31 downto 0);
		fp_reg : in std_logic_vector(31 downto 0);
		s1_reg : in std_logic_vector(31 downto 0);
		a0_reg : in std_logic_vector(31 downto 0);
		a1_reg : in std_logic_vector(31 downto 0);
		a2_reg : in std_logic_vector(31 downto 0);
		a3_reg : in std_logic_vector(31 downto 0);
		a4_reg : in std_logic_vector(31 downto 0);
		a5_reg : in std_logic_vector(31 downto 0);
		a6_reg : in std_logic_vector(31 downto 0);
		a7_reg : in std_logic_vector(31 downto 0);
		s2_reg : in std_logic_vector(31 downto 0);
		s3_reg : in std_logic_vector(31 downto 0);
		s4_reg : in std_logic_vector(31 downto 0);
		s5_reg : in std_logic_vector(31 downto 0);
		s6_reg : in std_logic_vector(31 downto 0);
		s7_reg : in std_logic_vector(31 downto 0);
		s8_reg : in std_logic_vector(31 downto 0);
		s9_reg : in std_logic_vector(31 downto 0);
		s10_reg : in std_logic_vector(31 downto 0);
		s11_reg : in std_logic_vector(31 downto 0);
		t3_reg : in std_logic_vector(31 downto 0);
		t4_reg : in std_logic_vector(31 downto 0);
		t5_reg : in std_logic_vector(31 downto 0);
		t6_reg : in std_logic_vector(31 downto 0);
		pc_reg : in std_logic_vector(31 downto 0);
		interrupt : in std_logic;
		interrupt_cause : in std_logic_vector(31 downto 0);
		time_reg : in std_logic_vector(31 downto 0);
		debug : in std_logic;
		isa : in std_logic_vector(31 downto 0);
		sd : in std_logic;
		sd_rv32 : in std_logic;
		mpp : in std_logic_vector(31 downto 0);
		spp : in std_logic;
		mpie : in std_logic;
		mie : in std_logic;
		evec_reg : in std_logic_vector(31 downto 0);
		save_regs : in std_logic
	);
end axi_full_reg_reader_v1_0;

architecture arch_imp of axi_full_reg_reader_v1_0 is

	-- component declaration
	component axi_full_reg_reader_v1_0_S00_AXI is
		generic (
		C_S_AXI_ID_WIDTH	: integer	:= 1;
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		C_S_AXI_ADDR_WIDTH	: integer	:= 6;
		C_S_AXI_AWUSER_WIDTH	: integer	:= 0;
		C_S_AXI_ARUSER_WIDTH	: integer	:= 0;
		C_S_AXI_WUSER_WIDTH	: integer	:= 0;
		C_S_AXI_RUSER_WIDTH	: integer	:= 0;
		C_S_AXI_BUSER_WIDTH	: integer	:= 0
		);
		port (
		S_AXI_ACLK	: in std_logic;
		S_AXI_ARESETN	: in std_logic;
		S_AXI_AWID	: in std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_AWLEN	: in std_logic_vector(7 downto 0);
		S_AXI_AWSIZE	: in std_logic_vector(2 downto 0);
		S_AXI_AWBURST	: in std_logic_vector(1 downto 0);
		S_AXI_AWLOCK	: in std_logic;
		S_AXI_AWCACHE	: in std_logic_vector(3 downto 0);
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		S_AXI_AWQOS	: in std_logic_vector(3 downto 0);
		S_AXI_AWREGION	: in std_logic_vector(3 downto 0);
		S_AXI_AWUSER	: in std_logic_vector(C_S_AXI_AWUSER_WIDTH-1 downto 0);
		S_AXI_AWVALID	: in std_logic;
		S_AXI_AWREADY	: out std_logic;
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		S_AXI_WLAST	: in std_logic;
		S_AXI_WUSER	: in std_logic_vector(C_S_AXI_WUSER_WIDTH-1 downto 0);
		S_AXI_WVALID	: in std_logic;
		S_AXI_WREADY	: out std_logic;
		S_AXI_BID	: out std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		S_AXI_BUSER	: out std_logic_vector(C_S_AXI_BUSER_WIDTH-1 downto 0);
		S_AXI_BVALID	: out std_logic;
		S_AXI_BREADY	: in std_logic;
		S_AXI_ARID	: in std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		S_AXI_ARLEN	: in std_logic_vector(7 downto 0);
		S_AXI_ARSIZE	: in std_logic_vector(2 downto 0);
		S_AXI_ARBURST	: in std_logic_vector(1 downto 0);
		S_AXI_ARLOCK	: in std_logic;
		S_AXI_ARCACHE	: in std_logic_vector(3 downto 0);
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		S_AXI_ARQOS	: in std_logic_vector(3 downto 0);
		S_AXI_ARREGION	: in std_logic_vector(3 downto 0);
		S_AXI_ARUSER	: in std_logic_vector(C_S_AXI_ARUSER_WIDTH-1 downto 0);
		S_AXI_ARVALID	: in std_logic;
		S_AXI_ARREADY	: out std_logic;
		S_AXI_RID	: out std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		S_AXI_RLAST	: out std_logic;
		S_AXI_RUSER	: out std_logic_vector(C_S_AXI_RUSER_WIDTH-1 downto 0);
		S_AXI_RVALID	: out std_logic;
		S_AXI_RREADY	: in std_logic;
		ra_reg : in std_logic_vector(31 downto 0);
		sp_reg : in std_logic_vector(31 downto 0);
		gp_reg : in std_logic_vector(31 downto 0);
		tp_reg : in std_logic_vector(31 downto 0);
		t0_reg : in std_logic_vector(31 downto 0);
		t1_reg : in std_logic_vector(31 downto 0);
		t2_reg : in std_logic_vector(31 downto 0);
		fp_reg : in std_logic_vector(31 downto 0);
		s1_reg : in std_logic_vector(31 downto 0);
		a0_reg : in std_logic_vector(31 downto 0);
		a1_reg : in std_logic_vector(31 downto 0);
		a2_reg : in std_logic_vector(31 downto 0);
		a3_reg : in std_logic_vector(31 downto 0);
		a4_reg : in std_logic_vector(31 downto 0);
		a5_reg : in std_logic_vector(31 downto 0);
		a6_reg : in std_logic_vector(31 downto 0);
		a7_reg : in std_logic_vector(31 downto 0);
		s2_reg : in std_logic_vector(31 downto 0);
		s3_reg : in std_logic_vector(31 downto 0);
		s4_reg : in std_logic_vector(31 downto 0);
		s5_reg : in std_logic_vector(31 downto 0);
		s6_reg : in std_logic_vector(31 downto 0);
		s7_reg : in std_logic_vector(31 downto 0);
		s8_reg : in std_logic_vector(31 downto 0);
		s9_reg : in std_logic_vector(31 downto 0);
		s10_reg : in std_logic_vector(31 downto 0);
		s11_reg : in std_logic_vector(31 downto 0);
		t3_reg : in std_logic_vector(31 downto 0);
		t4_reg : in std_logic_vector(31 downto 0);
		t5_reg : in std_logic_vector(31 downto 0);
		t6_reg : in std_logic_vector(31 downto 0);
		pc_reg : in std_logic_vector(31 downto 0);
		interrupt : in std_logic;
		interrupt_cause : in std_logic_vector(31 downto 0);
		time_reg : in std_logic_vector(31 downto 0);
		debug : in std_logic;
		isa : in std_logic_vector(31 downto 0);
		sd : in std_logic;
		sd_rv32 : in std_logic;
		mpp : in std_logic_vector(31 downto 0);
		spp : in std_logic;
		mpie : in std_logic;
		mie : in std_logic;
		evec_reg : in std_logic_vector(31 downto 0);
		save_regs : in std_logic
		);
	end component axi_full_reg_reader_v1_0_S00_AXI;

begin

-- Instantiation of Axi Bus Interface S00_AXI
axi_full_reg_reader_v1_0_S00_AXI_inst : axi_full_reg_reader_v1_0_S00_AXI
	generic map (
		C_S_AXI_ID_WIDTH	=> C_S00_AXI_ID_WIDTH,
		C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
		C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH,
		C_S_AXI_AWUSER_WIDTH	=> C_S00_AXI_AWUSER_WIDTH,
		C_S_AXI_ARUSER_WIDTH	=> C_S00_AXI_ARUSER_WIDTH,
		C_S_AXI_WUSER_WIDTH	=> C_S00_AXI_WUSER_WIDTH,
		C_S_AXI_RUSER_WIDTH	=> C_S00_AXI_RUSER_WIDTH,
		C_S_AXI_BUSER_WIDTH	=> C_S00_AXI_BUSER_WIDTH
	)
	port map (
		S_AXI_ACLK	=> s00_axi_aclk,
		S_AXI_ARESETN	=> s00_axi_aresetn,
		S_AXI_AWID	=> s00_axi_awid,
		S_AXI_AWADDR	=> s00_axi_awaddr,
		S_AXI_AWLEN	=> s00_axi_awlen,
		S_AXI_AWSIZE	=> s00_axi_awsize,
		S_AXI_AWBURST	=> s00_axi_awburst,
		S_AXI_AWLOCK	=> s00_axi_awlock,
		S_AXI_AWCACHE	=> s00_axi_awcache,
		S_AXI_AWPROT	=> s00_axi_awprot,
		S_AXI_AWQOS	=> s00_axi_awqos,
		S_AXI_AWREGION	=> s00_axi_awregion,
		S_AXI_AWUSER	=> s00_axi_awuser,
		S_AXI_AWVALID	=> s00_axi_awvalid,
		S_AXI_AWREADY	=> s00_axi_awready,
		S_AXI_WDATA	=> s00_axi_wdata,
		S_AXI_WSTRB	=> s00_axi_wstrb,
		S_AXI_WLAST	=> s00_axi_wlast,
		S_AXI_WUSER	=> s00_axi_wuser,
		S_AXI_WVALID	=> s00_axi_wvalid,
		S_AXI_WREADY	=> s00_axi_wready,
		S_AXI_BID	=> s00_axi_bid,
		S_AXI_BRESP	=> s00_axi_bresp,
		S_AXI_BUSER	=> s00_axi_buser,
		S_AXI_BVALID	=> s00_axi_bvalid,
		S_AXI_BREADY	=> s00_axi_bready,
		S_AXI_ARID	=> s00_axi_arid,
		S_AXI_ARADDR	=> s00_axi_araddr,
		S_AXI_ARLEN	=> s00_axi_arlen,
		S_AXI_ARSIZE	=> s00_axi_arsize,
		S_AXI_ARBURST	=> s00_axi_arburst,
		S_AXI_ARLOCK	=> s00_axi_arlock,
		S_AXI_ARCACHE	=> s00_axi_arcache,
		S_AXI_ARPROT	=> s00_axi_arprot,
		S_AXI_ARQOS	=> s00_axi_arqos,
		S_AXI_ARREGION	=> s00_axi_arregion,
		S_AXI_ARUSER	=> s00_axi_aruser,
		S_AXI_ARVALID	=> s00_axi_arvalid,
		S_AXI_ARREADY	=> s00_axi_arready,
		S_AXI_RID	=> s00_axi_rid,
		S_AXI_RDATA	=> s00_axi_rdata,
		S_AXI_RRESP	=> s00_axi_rresp,
		S_AXI_RLAST	=> s00_axi_rlast,
		S_AXI_RUSER	=> s00_axi_ruser,
		S_AXI_RVALID	=> s00_axi_rvalid,
		S_AXI_RREADY	=> s00_axi_rready,
		ra_reg => ra_reg,
		sp_reg => sp_reg,
		gp_reg => gp_reg,
		tp_reg => tp_reg,
		t0_reg => t0_reg,
		t1_reg => t1_reg,
		t2_reg => t2_reg,
		fp_reg => fp_reg,
		s1_reg => s1_reg,
		a0_reg => a0_reg,
		a1_reg => a1_reg,
		a2_reg => a2_reg,
		a3_reg => a3_reg,
		a4_reg => a4_reg,
		a5_reg => a5_reg,
		a6_reg => a6_reg,
		a7_reg => a7_reg,
		s2_reg => s2_reg,
		s3_reg => s3_reg,
		s4_reg => s4_reg,
		s5_reg => s5_reg,
		s6_reg => s6_reg,
		s7_reg => s7_reg,
		s8_reg => s8_reg,
		s9_reg => s9_reg,
		s10_reg => s10_reg,
		s11_reg => s11_reg,
		t3_reg => t3_reg,
		t4_reg => t4_reg,
		t5_reg => t5_reg,
		t6_reg => t6_reg,
		pc_reg => pc_reg,
		interrupt => interrupt,
		interrupt_cause => interrupt_cause,
		time_reg => time_reg,
		debug => debug,
		isa => isa,
		sd => sd,
		sd_rv32 => sd_rv32,
		mpp => mpp,
		spp => spp,
		mpie => mpie,
		mie => mie,
		evec_reg => evec_reg,
		save_regs => save_regs
	);

end arch_imp;
