`timescale  1ms/1ms
`include "level2/timer_and_input_control/timer_input_and_control_module.v"
`include "level2/decodificador/decodificador.v"
`include "level2/timer/timer.v"
`include "level2/magcontrol/mag_control.v"


module microwave_oven(
    input wire [9:0] keypad,
    input wire clock, startn, stopn, clearn, door_closed,
    output wire [6:0] sec_ones_segs, sec_tens_segs, min_segs,
    output wire mag_on);

    // internal wires

    wire [3:0] D;
    wire loadn, pgt_1Hz;
    wire magnetronOut;
    wire [3:0] sec_ones, sec_tens, min;
    wire zeroOut;

    //timer
    timer timer_module(
        .data(D),
        .loadn(loadn),
        .clrn(clearn),
        .enable(magnetronOut),
        .sec_ones(sec_ones),
        .sec_decs(sec_tens),
        .mins(min),
        .zero(zeroOut),
        .clk(pgt_1Hz)
    );

    //magnecontrol
    mag_control mag_control_module(
        .startn(startn),
        .stopn(stopn),
        .clrn(clearn),
        .door_closed(door_closed),
        .timer_done(zeroOut),
        .mag_on(magnetronOut)
    );

    //encoder
    timer_input_and_control_module encoder_module(
        .D(D),
        .loadn(loadn),
        .pgt_1Hz(pgt_1Hz),
        .numpad(keypad),
        .enablen(magnetronOut),
        .clock_100Hz(clock)
    );

    //decoder
    decodificador decoder_module(
        .sec_ones(sec_ones),
        .sec_tens(sec_tens),
        .min(min),
        .sec_ones_segs(sec_ones_segs),
        .sec_tens_segs(sec_tens_segs),
        .min_segs(min_segs)
    );

    assign mag_on = magnetronOut;

endmodule