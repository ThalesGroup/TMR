`timescale 1 ps / 1 ps

module design_1_wrapper
   (led);
  output led;
  
  wire clk_out1_0;
  reg [23:0] counter, counter_next;
  
  initial counter = 24'h000000;
  initial counter_next = 24'h000000;
  
  assign led = counter[23];
  
  always @ (*) begin
    counter_next = counter + 1'b1;
  end
  
  always @ ( posedge clk_out1_0)
  begin
    counter = counter_next;
  end 

  design_1 design_1_i
       (.clk_out1_0(clk_out1_0)
       );
  endmodule
