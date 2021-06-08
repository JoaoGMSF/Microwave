`timescale 1ms/1ms
`include "counter_divide_by_100.v"

module test;
 	
  reg clk = 1'b1;
  wire newclk;
  
  COUNTER_DivideFrequencyBy100 counter(
    .clk(clk),
    .newclk(newclk)
  );
  
  //clock 
  always #5 clk <= ~clk;
  
  initial begin
    #15000;
    $finish();
  end
  
  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,test);

  end
  
endmodule
