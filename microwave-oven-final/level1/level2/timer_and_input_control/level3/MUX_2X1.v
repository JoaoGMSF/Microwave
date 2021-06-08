//MUX_2X1
// quando select=0: out = in1.
// quando select=1: out = 1n2.

`timescale  1ms/1ms

module MUX_2X1(input in1,in2,select, output out);  
  wire select_not, out1, out2;
  
  assign select_not = !select; 
  assign out1 = in1 && select_not;
  assign out2 = in2 && select;
  assign out = out1 || out2;
  
endmodule
