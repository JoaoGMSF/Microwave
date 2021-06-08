`include "level2/timer/level3/countermod6.v"
`include "level2/timer/level3/countermod10.v"

module timer (
  input wire [3:0] data,
  input wire loadn, clrn, clk, enable,
  inout wire [3:0] sec_ones, sec_decs, mins,
  output zero);

  wire tc1, tc2, tc3, zero1, zero2, zero3;
  counter_mod10 contador1(.ones(sec_ones), .tc(tc1), .zero(zero1), .data(data), 
                          .loadn(loadn), .clrn(clrn), .clock(clk), .enable(enable));

  counter_mod6 contador2(.ones(sec_decs), .tc(tc2), .zero(zero2), .data(sec_ones), 
                          .loadn(loadn), .clrn(clrn), .clock(clk), .enable(tc1));

  counter_mod10 contador3(.ones(mins), .tc(tc3), .zero(zero3), .data(sec_decs), 
                          .loadn(loadn), .clrn(clrn), .clock(clk), .enable(tc2));

  assign zero=zero1&&zero2&&zero3;

endmodule