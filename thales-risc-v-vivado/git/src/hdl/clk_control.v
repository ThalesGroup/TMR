`timescale 1 ps / 1 ps

module clk_control
  (clk_in,
   clk_out,
   enable);

  input clk_in;
  output clk_out;
  input enable;

  wire clk_in;
  wire clk_out;
  wire enable;

  BUFGCE #(
    .CE_TYPE("SYNC"),      // ASYNC, SYNC
    .IS_CE_INVERTED(1'b0), // Programmable inversion on CE
    .IS_I_INVERTED(1'b0)   // Programmable inversion on I
  )
  BUFGCE_inst (
    .O(clk_out),   // 1-bit output: Buffer
    .CE(enable),   // 1-bit input: Buffer enable
    .I(clk_in)     // 1-bit input: Buffer
  );

endmodule
