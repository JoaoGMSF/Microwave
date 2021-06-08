`timescale 1ms/1ms
`include "MUX_2X1_tb.v"

module test;

reg in1,in2,select;
wire out;

MUX_2X1 MUX_2X1(
  .in1(in1),
  .in2(in2),
  .select(select),
  .out(out)
);

initial 
  begin
    $dumpfile("test.vcd");
    $dumpvars(0, test);
    
    in1 = 1;
    in2 = 0;
    #5;
    select = 0;
    #5;
    select = 1;
    #5;
    
  end

endmodule
