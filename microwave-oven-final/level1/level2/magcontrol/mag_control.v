`include "level2/magcontrol/level3/controle.v"
`include "level2/magcontrol/level3/latchSR.v"
module mag_control (input  wire startn, stopn, clrn, door_closed, timer_done,
                    output wire mag_on);
    wire Set, Reset;
    // reg mag_aux;
    wire i;
    controle U1 (.startn(startn), .stopn(stopn), .clrn(clrn), 
                 .door_closed(door_closed), .timer_done(timer_done), 
                 .S(Set), .R(Reset));
    latchSR U2 (.S(Set), .R(Reset), .Q(mag_on), .Qn(i));
endmodule