`timescale  1ms/1ms
`include "level2/timer_and_input_control/level3/counter_divide_by_100.v"
`include "level2/timer_and_input_control/level3/MUX_2X1.v"
`include "level2/timer_and_input_control/level3/numpad_encoder.v"
`include "level2/timer_and_input_control/level3/counter_0to7_nonRecycling.v"

module timer_input_and_control_module(
    output wire [3:0] D,
    output wire loadn,
    output wire pgt_1Hz,
    input [9:0] numpad,
    input enablen,
    input clock_100Hz
);

    wire dataValid;

    numpad_encoder encoder(
        .BCDout(D),
        .validData(dataValid),
        .enablen(enablen),
        .numpad(numpad)
    );

    assign loadn = dataValid;

    wire debounceCounterOut;

    counter_0to7_nonRecycling counter(
        .out(debounceCounterOut),
        .clear(dataValid),
        .clk(clock_100Hz)
    );

    wire clock_1Hz;

    counter_divide_by_100 count(
        .clk(clock_100Hz),
        .newclk(clock_1Hz)
    );

    MUX_2X1 mux(
        .in1(debounceCounterOut),
        .in2(clock_1Hz),
        .select(enablen),
        .out(pgt_1Hz)
    );    

endmodule