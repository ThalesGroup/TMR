`timescale 1 ps / 1 ps

module split
  (vector_in,
   signal_out0,
   signal_out1,
   signal_out2
  );

  input [2:0] vector_in;
  output signal_out0;
  output signal_out1;
  output signal_out2;

  wire [2:0] vector_in;
  wire signal_out0;
  wire signal_out1;
  wire signal_out2;

  assign signal_out0 = vector_in[0];
  assign signal_out1 = vector_in[1];
  assign signal_out2 = vector_in[2];

endmodule
