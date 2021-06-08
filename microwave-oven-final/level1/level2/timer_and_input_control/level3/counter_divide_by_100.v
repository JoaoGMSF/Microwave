`timescale 1ms/1ms

module counter_divide_by_100(input clk, output reg newclk);
  reg [6:0] count = 7'b0000000;
  
  always @(posedge clk)
    begin
      count = count+1;
      newclk = count[5];
    end
  
endmodule

