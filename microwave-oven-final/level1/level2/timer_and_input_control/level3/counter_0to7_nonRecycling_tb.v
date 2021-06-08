`timescale 1ms/1ms
`include "counter_0to7_nonRecycling.v"

module test;
  
  reg clear;
  reg clk = 0;
  wire out;
  
  COUNTER_0to7_nonRecycling counter_0to7(
    .out(out),
    .clear(clear),
    .clk(clk)
  );
  
  // clock
  always #5 clk <= ~clk; 
  
  initial begin
  
    $dumpfile("test.vcd");
    $dumpvars(0,test);
   
    // (clear == 1)contador travado no 0
    clear = 1;
    #100;
    
    // (clear == 0)contador livre pra contar
    clear = 0;
    #200;
    
    // (clear == 1)contador travado no 0
    clear = 1;
    #100;
    
    
    // (clear == 0)contador livre pra contar
    clear = 0; 
    #100;
    
    $finish();
    
  end
  
