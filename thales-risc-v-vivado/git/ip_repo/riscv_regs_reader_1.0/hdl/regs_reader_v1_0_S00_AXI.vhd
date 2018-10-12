-- Copyright © 2018. Thales SA
-- All rights reservedlibrary ieee;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axi_full_reg_reader_v1_0_S00_AXI is
	generic (
		-- Users to add parameters here

		-- User parameters ends
		-- Do not modify the parameters beyond this line

		-- Width of ID for for write address, write data, read address and read data
		C_S_AXI_ID_WIDTH	: integer	:= 1;
		-- Width of S_AXI data bus
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		-- Width of S_AXI address bus
		C_S_AXI_ADDR_WIDTH	: integer	:= 6;
		-- Width of optional user defined signal in write address channel
		C_S_AXI_AWUSER_WIDTH	: integer	:= 0;
		-- Width of optional user defined signal in read address channel
		C_S_AXI_ARUSER_WIDTH	: integer	:= 0;
		-- Width of optional user defined signal in write data channel
		C_S_AXI_WUSER_WIDTH	: integer	:= 0;
		-- Width of optional user defined signal in read data channel
		C_S_AXI_RUSER_WIDTH	: integer	:= 0;
		-- Width of optional user defined signal in write response channel
		C_S_AXI_BUSER_WIDTH	: integer	:= 0
	);
	port (
		-- Users to add ports here

		-- User ports ends
		-- Do not modify the ports beyond this line

		-- Global Clock Signal
		S_AXI_ACLK	: in std_logic;
		-- Global Reset Signal. This Signal is Active LOW
		S_AXI_ARESETN	: in std_logic;
		-- Write Address ID
		S_AXI_AWID	: in std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		-- Write address
		S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		-- Burst length. The burst length gives the exact number of transfers in a burst
		S_AXI_AWLEN	: in std_logic_vector(7 downto 0);
		-- Burst size. This signal indicates the size of each transfer in the burst
		S_AXI_AWSIZE	: in std_logic_vector(2 downto 0);
		-- Burst type. The burst type and the size information, 
    -- determine how the address for each transfer within the burst is calculated.
		S_AXI_AWBURST	: in std_logic_vector(1 downto 0);
		-- Lock type. Provides additional information about the
    -- atomic characteristics of the transfer.
		S_AXI_AWLOCK	: in std_logic;
		-- Memory type. This signal indicates how transactions
    -- are required to progress through a system.
		S_AXI_AWCACHE	: in std_logic_vector(3 downto 0);
		-- Protection type. This signal indicates the privilege
    -- and security level of the transaction, and whether
    -- the transaction is a data access or an instruction access.
		S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
		-- Quality of Service, QoS identifier sent for each
    -- write transaction.
		S_AXI_AWQOS	: in std_logic_vector(3 downto 0);
		-- Region identifier. Permits a single physical interface
    -- on a slave to be used for multiple logical interfaces.
		S_AXI_AWREGION	: in std_logic_vector(3 downto 0);
		-- Optional User-defined signal in the write address channel.
		S_AXI_AWUSER	: in std_logic_vector(C_S_AXI_AWUSER_WIDTH-1 downto 0);
		-- Write address valid. This signal indicates that
    -- the channel is signaling valid write address and
    -- control information.
		S_AXI_AWVALID	: in std_logic;
		-- Write address ready. This signal indicates that
    -- the slave is ready to accept an address and associated
    -- control signals.
		S_AXI_AWREADY	: out std_logic;
		-- Write Data
		S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		-- Write strobes. This signal indicates which byte
    -- lanes hold valid data. There is one write strobe
    -- bit for each eight bits of the write data bus.
		S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
		-- Write last. This signal indicates the last transfer
    -- in a write burst.
		S_AXI_WLAST	: in std_logic;
		-- Optional User-defined signal in the write data channel.
		S_AXI_WUSER	: in std_logic_vector(C_S_AXI_WUSER_WIDTH-1 downto 0);
		-- Write valid. This signal indicates that valid write
    -- data and strobes are available.
		S_AXI_WVALID	: in std_logic;
		-- Write ready. This signal indicates that the slave
    -- can accept the write data.
		S_AXI_WREADY	: out std_logic;
		-- Response ID tag. This signal is the ID tag of the
    -- write response.
		S_AXI_BID	: out std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		-- Write response. This signal indicates the status
    -- of the write transaction.
		S_AXI_BRESP	: out std_logic_vector(1 downto 0);
		-- Optional User-defined signal in the write response channel.
		S_AXI_BUSER	: out std_logic_vector(C_S_AXI_BUSER_WIDTH-1 downto 0);
		-- Write response valid. This signal indicates that the
    -- channel is signaling a valid write response.
		S_AXI_BVALID	: out std_logic;
		-- Response ready. This signal indicates that the master
    -- can accept a write response.
		S_AXI_BREADY	: in std_logic;
		-- Read address ID. This signal is the identification
    -- tag for the read address group of signals.
		S_AXI_ARID	: in std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		-- Read address. This signal indicates the initial
    -- address of a read burst transaction.
		S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
		-- Burst length. The burst length gives the exact number of transfers in a burst
		S_AXI_ARLEN	: in std_logic_vector(7 downto 0);
		-- Burst size. This signal indicates the size of each transfer in the burst
		S_AXI_ARSIZE	: in std_logic_vector(2 downto 0);
		-- Burst type. The burst type and the size information, 
    -- determine how the address for each transfer within the burst is calculated.
		S_AXI_ARBURST	: in std_logic_vector(1 downto 0);
		-- Lock type. Provides additional information about the
    -- atomic characteristics of the transfer.
		S_AXI_ARLOCK	: in std_logic;
		-- Memory type. This signal indicates how transactions
    -- are required to progress through a system.
		S_AXI_ARCACHE	: in std_logic_vector(3 downto 0);
		-- Protection type. This signal indicates the privilege
    -- and security level of the transaction, and whether
    -- the transaction is a data access or an instruction access.
		S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
		-- Quality of Service, QoS identifier sent for each
    -- read transaction.
		S_AXI_ARQOS	: in std_logic_vector(3 downto 0);
		-- Region identifier. Permits a single physical interface
    -- on a slave to be used for multiple logical interfaces.
		S_AXI_ARREGION	: in std_logic_vector(3 downto 0);
		-- Optional User-defined signal in the read address channel.
		S_AXI_ARUSER	: in std_logic_vector(C_S_AXI_ARUSER_WIDTH-1 downto 0);
		-- Write address valid. This signal indicates that
    -- the channel is signaling valid read address and
    -- control information.
		S_AXI_ARVALID	: in std_logic;
		-- Read address ready. This signal indicates that
    -- the slave is ready to accept an address and associated
    -- control signals.
		S_AXI_ARREADY	: out std_logic;
		-- Read ID tag. This signal is the identification tag
    -- for the read data group of signals generated by the slave.
		S_AXI_RID	: out std_logic_vector(C_S_AXI_ID_WIDTH-1 downto 0);
		-- Read Data
		S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
		-- Read response. This signal indicates the status of
    -- the read transfer.
		S_AXI_RRESP	: out std_logic_vector(1 downto 0);
		-- Read last. This signal indicates the last transfer
    -- in a read burst.
		S_AXI_RLAST	: out std_logic;
		-- Optional User-defined signal in the read address channel.
		S_AXI_RUSER	: out std_logic_vector(C_S_AXI_RUSER_WIDTH-1 downto 0);
		-- Read valid. This signal indicates that the channel
    -- is signaling the required read data.
		S_AXI_RVALID	: out std_logic;
		-- Read ready. This signal indicates that the master can
    -- accept the read data and response information.
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
end axi_full_reg_reader_v1_0_S00_AXI;

architecture arch_imp of axi_full_reg_reader_v1_0_S00_AXI is

	-- AXI4FULL signals
	signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_awready	: std_logic;
	signal axi_wready	: std_logic;
	signal axi_bresp	: std_logic_vector(1 downto 0);
	signal axi_buser	: std_logic_vector(C_S_AXI_BUSER_WIDTH-1 downto 0);
	signal axi_bvalid	: std_logic;
	signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
	signal axi_arready	: std_logic;
	signal axi_rdata	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal axi_rresp	: std_logic_vector(1 downto 0);
	signal axi_rlast	: std_logic;
	signal axi_ruser	: std_logic_vector(C_S_AXI_RUSER_WIDTH-1 downto 0);
	signal axi_rvalid	: std_logic;
	-- aw_wrap_en determines wrap boundary and enables wrapping
	signal  aw_wrap_en : std_logic; 
	-- ar_wrap_en determines wrap boundary and enables wrapping
	signal  ar_wrap_en : std_logic;
	-- aw_wrap_size is the size of the write transfer, the
	-- write address wraps to a lower address if upper address
	-- limit is reached
	signal aw_wrap_size : integer;
	-- ar_wrap_size is the size of the read transfer, the
	-- read address wraps to a lower address if upper address
	-- limit is reached
	signal ar_wrap_size : integer;
	-- The axi_awv_awr_flag flag marks the presence of write address valid
	signal axi_awv_awr_flag    : std_logic;
	--The axi_arv_arr_flag flag marks the presence of read address valid
	signal axi_arv_arr_flag    : std_logic;
	-- The axi_awlen_cntr internal write address counter to keep track of beats in a burst transaction
	signal axi_awlen_cntr      : std_logic_vector(7 downto 0);
	--The axi_arlen_cntr internal read address counter to keep track of beats in a burst transaction
	signal axi_arlen_cntr      : std_logic_vector(7 downto 0);
	signal axi_arburst      : std_logic_vector(2-1 downto 0);
	signal axi_awburst      : std_logic_vector(2-1 downto 0);
	signal axi_arlen      : std_logic_vector(8-1 downto 0);
	signal axi_awlen      : std_logic_vector(8-1 downto 0);
	--local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
	--ADDR_LSB is used for addressing 32/64 bit registers/memories
	--ADDR_LSB = 2 for 32 bits (n downto 2) 
	--ADDR_LSB = 3 for 42 bits (n downto 3)

	constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
	constant OPT_MEM_ADDR_BITS : integer := 6;
	constant USER_NUM_MEM: integer := 1;
	constant low : std_logic_vector (C_S_AXI_ADDR_WIDTH - 1 downto 0) := "000000000";
	------------------------------------------------
	---- Signals for user logic memory space example
	--------------------------------------------------
	signal mem_address : std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	signal mem_select : std_logic_vector(USER_NUM_MEM-1 downto 0);
	type word_array is array (0 to USER_NUM_MEM-1) of std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal mem_data_out : word_array;

	signal i : integer;
	signal j : integer;
	signal mem_byte_index : integer;
	type BYTE_RAM_TYPE is array (0 to 15) of std_logic_vector(7 downto 0);
	signal mem_rden : std_logic;
	signal mem_wren : std_logic;
	signal ra_reg_latched : std_logic_vector(31 downto 0);
        signal sp_reg_latched : std_logic_vector(31 downto 0);
        signal gp_reg_latched : std_logic_vector(31 downto 0);
        signal tp_reg_latched : std_logic_vector(31 downto 0);
        signal t0_reg_latched : std_logic_vector(31 downto 0);
        signal t1_reg_latched : std_logic_vector(31 downto 0);
        signal t2_reg_latched : std_logic_vector(31 downto 0);
        signal fp_reg_latched : std_logic_vector(31 downto 0);
        signal s1_reg_latched : std_logic_vector(31 downto 0);
        signal a0_reg_latched : std_logic_vector(31 downto 0);
        signal a1_reg_latched : std_logic_vector(31 downto 0);
        signal a2_reg_latched : std_logic_vector(31 downto 0);
        signal a3_reg_latched : std_logic_vector(31 downto 0);
        signal a4_reg_latched : std_logic_vector(31 downto 0);
        signal a5_reg_latched : std_logic_vector(31 downto 0);
        signal a6_reg_latched : std_logic_vector(31 downto 0);
        signal a7_reg_latched : std_logic_vector(31 downto 0);
        signal s2_reg_latched : std_logic_vector(31 downto 0);
        signal s3_reg_latched : std_logic_vector(31 downto 0);
        signal s4_reg_latched : std_logic_vector(31 downto 0);
        signal s5_reg_latched : std_logic_vector(31 downto 0);
        signal s6_reg_latched : std_logic_vector(31 downto 0);
        signal s7_reg_latched : std_logic_vector(31 downto 0);
        signal s8_reg_latched : std_logic_vector(31 downto 0);
        signal s9_reg_latched : std_logic_vector(31 downto 0);
        signal s10_reg_latched : std_logic_vector(31 downto 0);
        signal s11_reg_latched : std_logic_vector(31 downto 0);
        signal t3_reg_latched : std_logic_vector(31 downto 0);
        signal t4_reg_latched : std_logic_vector(31 downto 0);
        signal t5_reg_latched : std_logic_vector(31 downto 0);
        signal t6_reg_latched : std_logic_vector(31 downto 0);
        signal pc_reg_latched : std_logic_vector(31 downto 0);
	signal interrupt_latched : std_logic;
	signal interrupt_cause_latched : std_logic_vector(31 downto 0);
	signal time_latched : std_logic_vector(31 downto 0);
	signal debug_latched : std_logic;
	signal isa_latched : std_logic_vector(31 downto 0);
	signal sd_latched : std_logic;
	signal sd_rv32_latched : std_logic;
	signal mpp_latched : std_logic_vector(31 downto 0);
	signal spp_latched : std_logic;
	signal mpie_latched : std_logic;
	signal mie_latched : std_logic;
        signal evec_reg_latched : std_logic_vector(31 downto 0);
begin
	-- I/O Connections assignments

	S_AXI_AWREADY	<= axi_awready;
	S_AXI_WREADY	<= axi_wready;
	S_AXI_BRESP	<= axi_bresp;
	S_AXI_BUSER	<= axi_buser;
	S_AXI_BVALID	<= axi_bvalid;
	S_AXI_ARREADY	<= axi_arready;
	S_AXI_RDATA	<= axi_rdata;
	S_AXI_RRESP	<= axi_rresp;
	S_AXI_RLAST	<= axi_rlast;
	S_AXI_RUSER	<= axi_ruser;
	S_AXI_RVALID	<= axi_rvalid;
	S_AXI_BID <= S_AXI_AWID;
	S_AXI_RID <= S_AXI_ARID;
	aw_wrap_size <= ((C_S_AXI_DATA_WIDTH)/8 * to_integer(unsigned(axi_awlen))); 
	ar_wrap_size <= ((C_S_AXI_DATA_WIDTH)/8 * to_integer(unsigned(axi_arlen))); 
	aw_wrap_en <= '1' when (((axi_awaddr AND std_logic_vector(to_unsigned(aw_wrap_size,C_S_AXI_ADDR_WIDTH))) XOR std_logic_vector(to_unsigned(aw_wrap_size,C_S_AXI_ADDR_WIDTH))) = low) else '0';
	ar_wrap_en <= '1' when (((axi_araddr AND std_logic_vector(to_unsigned(ar_wrap_size,C_S_AXI_ADDR_WIDTH))) XOR std_logic_vector(to_unsigned(ar_wrap_size,C_S_AXI_ADDR_WIDTH))) = low) else '0';

	-- Implement axi_awready generation

	-- axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	-- de-asserted when reset is low.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awready <= '0';
	      axi_awv_awr_flag <= '0';
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and axi_awv_awr_flag = '0' and axi_arv_arr_flag = '0') then
	        -- slave is ready to accept an address and
	        -- associated control signals
	        axi_awv_awr_flag  <= '1'; -- used for generation of bresp() and bvalid
	        axi_awready <= '1';
	      elsif (S_AXI_WLAST = '1' and axi_wready = '1') then 
	      -- preparing to accept next address after current write burst tx completion
	        axi_awv_awr_flag  <= '0';
	      else
	        axi_awready <= '0';
	      end if;
	    end if;
	  end if;         
	end process; 
	-- Implement axi_awaddr latching

	-- This process is used to latch the address when both 
	-- S_AXI_AWVALID and S_AXI_WVALID are valid. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_awaddr <= (others => '0');
	      axi_awburst <= (others => '0'); 
	      axi_awlen <= (others => '0'); 
	      axi_awlen_cntr <= (others => '0');
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and axi_awv_awr_flag = '0') then
	      -- address latching 
	        axi_awaddr <= S_AXI_AWADDR(C_S_AXI_ADDR_WIDTH - 1 downto 0);  ---- start address of transfer
	        axi_awlen_cntr <= (others => '0');
	        axi_awburst <= S_AXI_AWBURST;
	        axi_awlen <= S_AXI_AWLEN;
	      elsif((axi_awlen_cntr <= axi_awlen) and axi_wready = '1' and S_AXI_WVALID = '1') then     
	        axi_awlen_cntr <= std_logic_vector (unsigned(axi_awlen_cntr) + 1);

	        case (axi_awburst) is
	          when "00" => -- fixed burst
	            -- The write address for all the beats in the transaction are fixed
	            axi_awaddr     <= axi_awaddr;       ----for awsize = 4 bytes (010)
	          when "01" => --incremental burst
	            -- The write address for all the beats in the transaction are increments by awsize
	            axi_awaddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB) <= std_logic_vector (unsigned(axi_awaddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB)) + 1);--awaddr aligned to 4 byte boundary
	            axi_awaddr(ADDR_LSB-1 downto 0)  <= (others => '0');  ----for awsize = 4 bytes (010)
	          when "10" => --Wrapping burst
	            -- The write address wraps when the address reaches wrap boundary 
	            if (aw_wrap_en = '1') then
	              axi_awaddr <= std_logic_vector (unsigned(axi_awaddr) - (to_unsigned(aw_wrap_size,C_S_AXI_ADDR_WIDTH)));                
	            else 
	              axi_awaddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB) <= std_logic_vector (unsigned(axi_awaddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB)) + 1);--awaddr aligned to 4 byte boundary
	              axi_awaddr(ADDR_LSB-1 downto 0)  <= (others => '0');  ----for awsize = 4 bytes (010)
	            end if;
	          when others => --reserved (incremental burst for example)
	            axi_awaddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB) <= std_logic_vector (unsigned(axi_awaddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB)) + 1);--for awsize = 4 bytes (010)
	            axi_awaddr(ADDR_LSB-1 downto 0)  <= (others => '0');
	        end case;        
	      end if;
	    end if;
	  end if;
	end process;
	-- Implement axi_wready generation

	-- axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	-- de-asserted when reset is low. 

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_wready <= '0';
	    else
	      if (axi_wready = '0' and S_AXI_WVALID = '1' and axi_awv_awr_flag = '1') then
	        axi_wready <= '1';
	        -- elsif (axi_awv_awr_flag = '0') then
	      elsif (S_AXI_WLAST = '1' and axi_wready = '1') then 

	        axi_wready <= '0';
	      end if;
	    end if;
	  end if;         
	end process; 
	-- Implement write response logic generation

	-- The write response and response valid signals are asserted by the slave 
	-- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	-- This marks the acceptance of address and indicates the status of 
	-- write transaction.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_bvalid  <= '0';
	      axi_bresp  <= "00"; --need to work more on the responses
	      axi_buser <= (others => '0');
	    else
	      if (axi_awv_awr_flag = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0' and S_AXI_WLAST = '1' ) then
	        axi_bvalid <= '1';
	        axi_bresp  <= "00"; 
	      elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then  
	      --check if bready is asserted while bvalid is high)
	        axi_bvalid <= '0';                      
	      end if;
	    end if;
	  end if;         
	end process; 
	-- Implement axi_arready generation

	-- axi_arready is asserted for one S_AXI_ACLK clock cycle when
	-- S_AXI_ARVALID is asserted. axi_awready is 
	-- de-asserted when reset (active low) is asserted. 
	-- The read address is also latched when S_AXI_ARVALID is 
	-- asserted. axi_araddr is reset to zero on reset assertion.

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_arready <= '0';
	      axi_arv_arr_flag <= '0';
	    else
	      if (axi_arready = '0' and S_AXI_ARVALID = '1' and axi_awv_awr_flag = '0' and axi_arv_arr_flag = '0') then
	        axi_arready <= '1';
	        axi_arv_arr_flag <= '1';
	      elsif (axi_rvalid = '1' and S_AXI_RREADY = '1' and (axi_arlen_cntr = axi_arlen)) then 
	      -- preparing to accept next address after current read completion
	        axi_arv_arr_flag <= '0';
	      else
	        axi_arready <= '0';
	      end if;
	    end if;
	  end if;         
	end process; 
	-- Implement axi_araddr latching

	--This process is used to latch the address when both 
	--S_AXI_ARVALID and S_AXI_RVALID are valid. 
	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then 
	    if S_AXI_ARESETN = '0' then
	      axi_araddr <= (others => '0');
	      axi_arburst <= (others => '0');
	      axi_arlen <= (others => '0'); 
	      axi_arlen_cntr <= (others => '0');
	      axi_rlast <= '0';
	      axi_ruser <= (others => '0');
	    else
	      if (axi_arready = '0' and S_AXI_ARVALID = '1' and axi_arv_arr_flag = '0') then
	        -- address latching 
	        axi_araddr <= S_AXI_ARADDR(C_S_AXI_ADDR_WIDTH - 1 downto 0); ---- start address of transfer
	        axi_arlen_cntr <= (others => '0');
	        axi_rlast <= '0';
	        axi_arburst <= S_AXI_ARBURST;
	        axi_arlen <= S_AXI_ARLEN;
	      elsif((axi_arlen_cntr <= axi_arlen) and axi_rvalid = '1' and S_AXI_RREADY = '1') then     
	        axi_arlen_cntr <= std_logic_vector (unsigned(axi_arlen_cntr) + 1);
	        axi_rlast <= '0';      
	     
	        case (axi_arburst) is
	          when "00" =>  -- fixed burst
	            -- The read address for all the beats in the transaction are fixed
	            axi_araddr     <= axi_araddr;      ----for arsize = 4 bytes (010)
	          when "01" =>  --incremental burst
	            -- The read address for all the beats in the transaction are increments by awsize
	            axi_araddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB) <= std_logic_vector (unsigned(axi_araddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB)) + 1); --araddr aligned to 4 byte boundary
	            axi_araddr(ADDR_LSB-1 downto 0)  <= (others => '0');  ----for awsize = 4 bytes (010)
	          when "10" =>  --Wrapping burst
	            -- The read address wraps when the address reaches wrap boundary 
	            if (ar_wrap_en = '1') then   
	              axi_araddr <= std_logic_vector (unsigned(axi_araddr) - (to_unsigned(ar_wrap_size,C_S_AXI_ADDR_WIDTH)));
	            else 
	              axi_araddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB) <= std_logic_vector (unsigned(axi_araddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB)) + 1); --araddr aligned to 4 byte boundary
	              axi_araddr(ADDR_LSB-1 downto 0)  <= (others => '0');  ----for awsize = 4 bytes (010)
	            end if;
	          when others => --reserved (incremental burst for example)
	            axi_araddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB) <= std_logic_vector (unsigned(axi_araddr(C_S_AXI_ADDR_WIDTH - 1 downto ADDR_LSB)) + 1);--for arsize = 4 bytes (010)
			  axi_araddr(ADDR_LSB-1 downto 0)  <= (others => '0');
	        end case;         
	      elsif((axi_arlen_cntr = axi_arlen) and axi_rlast = '0' and axi_arv_arr_flag = '1') then  
	        axi_rlast <= '1';
	      elsif (S_AXI_RREADY = '1') then  
	        axi_rlast <= '0';
	      end if;
	    end if;
	  end if;
	end  process;  
	-- Implement axi_arvalid generation

	-- axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	-- S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	-- data are available on the axi_rdata bus at this instance. The 
	-- assertion of axi_rvalid marks the validity of read data on the 
	-- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	-- is deasserted on reset (active low). axi_rresp and axi_rdata are 
	-- cleared to zero on reset (active low).  

	process (S_AXI_ACLK)
	begin
	  if rising_edge(S_AXI_ACLK) then
	    if S_AXI_ARESETN = '0' then
	      axi_rvalid <= '0';
	      axi_rresp  <= "00";
	    else
	      if (axi_arv_arr_flag = '1' and axi_rvalid = '0') then
	        axi_rvalid <= '1';
	        axi_rresp  <= "00"; -- 'OKAY' response
	      elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
	        axi_rvalid <= '0';
	      end  if;      
	    end if;
	  end if;
	end  process;
	-- ------------------------------------------
	-- -- Access the registers instead of memory
	-- ------------------------------------------

	mem_address <= axi_araddr(ADDR_LSB+OPT_MEM_ADDR_BITS downto ADDR_LSB) when axi_arv_arr_flag = '1' else
		       axi_awaddr(ADDR_LSB+OPT_MEM_ADDR_BITS downto ADDR_LSB) when axi_awv_awr_flag = '1' else
		       (others => '0');
	mem_wren <= axi_wready and S_AXI_WVALID ;
	mem_rden <= axi_arv_arr_flag ;

	process (save_regs) is
	begin
		if (save_regs = '1') then
			ra_reg_latched <= ra_reg;
                        sp_reg_latched <= sp_reg;
                        gp_reg_latched <= gp_reg;
                        tp_reg_latched <= tp_reg;
                        t0_reg_latched <= t0_reg;
                        t1_reg_latched <= t1_reg;
                        t2_reg_latched <= t2_reg;
                        fp_reg_latched <= fp_reg;
                        s1_reg_latched <= s1_reg;
                        a0_reg_latched <= a0_reg;
                        a1_reg_latched <= a1_reg;
                        a2_reg_latched <= a2_reg;
                        a3_reg_latched <= a3_reg;
                        a4_reg_latched <= a4_reg;
                        a5_reg_latched <= a5_reg;
                        a6_reg_latched <= a6_reg;
                        a7_reg_latched <= a7_reg;
                        s2_reg_latched <= s2_reg;
                        s3_reg_latched <= s3_reg;
                        s4_reg_latched <= s4_reg;
                        s5_reg_latched <= s5_reg;
                        s6_reg_latched <= s6_reg;
                        s7_reg_latched <= s7_reg;
                        s8_reg_latched <= s8_reg;
                        s9_reg_latched <= s9_reg;
                        s10_reg_latched <= s10_reg;
                        s11_reg_latched <= s11_reg;
                        t3_reg_latched <= t3_reg;
                        t4_reg_latched <= t4_reg;
                        t5_reg_latched <= t5_reg;
                        t6_reg_latched <= t6_reg;
                        pc_reg_latched <= pc_reg;
			interrupt_latched <= interrupt;
			interrupt_cause_latched <= interrupt_cause;
			time_latched <= time_reg;
			debug_latched <= debug;
			isa_latched <= isa;
			sd_latched <= sd;
			sd_rv32_latched <= sd_rv32;
			mpp_latched <= mpp;
			spp_latched <= spp;
			mpie_latched <= mpie;
			mie_latched <= mie;
			evec_reg_latched <= evec_reg;
		end if;
	end process;

	process( S_AXI_ACLK ) is
	begin
		if ( rising_edge (S_AXI_ACLK) ) then
			if ( mem_rden = '1') then 
				case mem_address is
					when X"0" => mem_data_out(0) <= ra_reg;
					when X"1" => mem_data_out(0) <= sp_reg;
					when X"2" => mem_data_out(0) <= gp_reg;
					when X"3" => mem_data_out(0) <= tp_reg;
					when X"4" => mem_data_out(0) <= t0_reg;
					when X"5" => mem_data_out(0) <= t1_reg;
					when X"6" => mem_data_out(0) <= t2_reg;
					when X"7" => mem_data_out(0) <= fp_reg;
					when X"8" => mem_data_out(0) <= s1_reg;
					when X"9" => mem_data_out(0) <= a0_reg;
					when X"A" => mem_data_out(0) <= a1_reg;
					when X"B" => mem_data_out(0) <= a2_reg;
					when X"C" => mem_data_out(0) <= a3_reg;
					when X"D" => mem_data_out(0) <= a4_reg;
					when X"E" => mem_data_out(0) <= a5_reg;
					when X"F" => mem_data_out(0) <= a6_reg;
					when X"10" => mem_data_out(0) <= a7_reg;
					when X"11" => mem_data_out(0) <= s2_reg;
					when X"12" => mem_data_out(0) <= s3_reg;
					when X"13" => mem_data_out(0) <= s4_reg;
					when X"14" => mem_data_out(0) <= s5_reg;
					when X"15" => mem_data_out(0) <= s6_reg;
					when X"16" => mem_data_out(0) <= s7_reg;
					when X"17" => mem_data_out(0) <= s8_reg;
					when X"18" => mem_data_out(0) <= s9_reg;
					when X"19" => mem_data_out(0) <= s10_reg;
					when X"1A" => mem_data_out(0) <= s11_reg;
					when X"1B" => mem_data_out(0) <= t3_reg;
					when X"1C" => mem_data_out(0) <= t4_reg;
					when X"1D" => mem_data_out(0) <= t5_reg;
					when X"1E" => mem_data_out(0) <= t6_reg;
					when X"1F" => mem_data_out(0) <= pc_reg;
					when X"20" => mem_data_out(0) <= ra_reg_latched;
					when X"21" => mem_data_out(0) <= sp_reg_latched;
					when X"22" => mem_data_out(0) <= gp_reg_latched;
					when X"23" => mem_data_out(0) <= tp_reg_latched;
					when X"24" => mem_data_out(0) <= t0_reg_latched;
					when X"25" => mem_data_out(0) <= t1_reg_latched;
					when X"26" => mem_data_out(0) <= t2_reg_latched;
					when X"27" => mem_data_out(0) <= fp_reg_latched;
					when X"28" => mem_data_out(0) <= s1_reg_latched;
					when X"29" => mem_data_out(0) <= a0_reg_latched;
					when X"2A" => mem_data_out(0) <= a1_reg_latched;
					when X"2B" => mem_data_out(0) <= a2_reg_latched;
					when X"2C" => mem_data_out(0) <= a3_reg_latched;
					when X"2D" => mem_data_out(0) <= a4_reg_latched;
					when X"2E" => mem_data_out(0) <= a5_reg_latched;
					when X"2F" => mem_data_out(0) <= a6_reg_latched;
					when X"30" => mem_data_out(0) <= a7_reg_latched;
					when X"31" => mem_data_out(0) <= s2_reg_latched;
					when X"32" => mem_data_out(0) <= s3_reg_latched;
					when X"33" => mem_data_out(0) <= s4_reg_latched;
					when X"34" => mem_data_out(0) <= s5_reg_latched;
					when X"35" => mem_data_out(0) <= s6_reg_latched;
					when X"36" => mem_data_out(0) <= s7_reg_latched;
					when X"37" => mem_data_out(0) <= s8_reg_latched;
					when X"38" => mem_data_out(0) <= s9_reg_latched;
					when X"39" => mem_data_out(0) <= s10_reg_latched;
					when X"3A" => mem_data_out(0) <= s11_reg_latched;
					when X"3B" => mem_data_out(0) <= t3_reg_latched;
					when X"3C" => mem_data_out(0) <= t4_reg_latched;
					when X"3D" => mem_data_out(0) <= t5_reg_latched;
					when X"3E" => mem_data_out(0) <= t6_reg_latched;
					when X"3F" => mem_data_out(0) <= pc_reg_latched;
					when X"40" => mem_data_out(0) <= (31 downto 1 => '0') & interrupt_latched;
					when X"41" => mem_data_out(0) <= interrupt_cause_latched;
					when X"42" => mem_data_out(0) <= time_latched;
					when X"43" => mem_data_out(0) <= (31 downto 1 => '0') & debug_latched;
					when X"44" => mem_data_out(0) <= isa_latched;
					when X"45" => mem_data_out(0) <= (31 downto 1 => '0') & sd_latched;
					when X"46" => mem_data_out(0) <= (31 downto 1 => '0') & sd_rv32_latched;
					when X"47" => mem_data_out(0) <= mpp_latched;
					when X"48" => mem_data_out(0) <= (31 downto 1 => '0') & spp_latched;
					when X"49" => mem_data_out(0) <= (31 downto 1 => '0') & mpie_latched;
					when X"4A" => mem_data_out(0) <= (31 downto 1 => '0') & mie_latched;
					when X"4B" => mem_data_out(0) <= evec_reg_latched;
					when others => mem_data_out(0) <= (others => '0');
				end case;
			end if;
		end if;
	end process;

	--Output register or memory read data

	process(mem_data_out, axi_rvalid ) is
	begin
	  if (axi_rvalid = '1') then
	    -- When there is a valid read address (S_AXI_ARVALID) with 
	    -- acceptance of read address by the slave (axi_arready), 
	    -- output the read dada 
	    axi_rdata <= mem_data_out(0);  -- memory range 0 read data
	  else
	    axi_rdata <= (others => '0');
	  end if;  
	end process;

	-- Add user logic here

	-- User logic ends

end arch_imp;
