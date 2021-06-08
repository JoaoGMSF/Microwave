`timescale 1ns / 1ps
`include "timer.v"

module test_timer;
	// Inputs
	reg clk ;
	reg clrn;
  reg loadn;
  reg enable;
  reg [3:0] data;
	// Output
	wire[3:0] sec_ones, sec_decs, mins;
  wire tc;
  wire zero;
	// Instantiate the Timer
  
	timer uut(
		.clk(clk), 
		.clrn(clrn),
    .loadn(loadn),
    .enable(enable),
    .data(data),
    .sec_ones(sec_ones),
    .sec_decs(sec_decs),
    .mins(mins),
    .zero(zero)
	);
 
always #1 clk <= ~clk;

initial 
  begin
  $dumpfile("test_timer.vcd");
  $dumpvars(0, test_timer);
  clk<=1;
  loadn<=0;
  data<=4'b1001;
  clrn<=1;
  enable<=1;
  #2
  loadn<=0;
  data<=4'b0011;
  clrn<=1;
  enable<=1;  
  #2
  loadn<=0;
  data<=4'b0010;
  clrn<=1;
  enable<=1;  
  #2
  loadn<=1;
  data<=4'b0011;
  clrn<=1;
  enable<=1;
  #500
  clrn<=0;
  #500
  $finish;
  end
 
endmodule