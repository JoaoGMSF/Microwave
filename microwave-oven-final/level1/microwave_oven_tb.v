`timescale 1ms/1ms
`include "microwave_oven.v"

module test;

reg [9:0] keypad;
reg clock, startn, stopn, clearn, door_closed;
wire [6:0] sec_ones_segs, sec_tens_segs, min_segs;
wire mag_on;
reg turn_microwave_on_button;


microwave_oven microwave(
    .keypad(keypad),
    .clock(clock),
    .startn(startn),
    .stopn(stopn),
    .clearn(clearn),
    .door_closed(door_closed),
    .sec_ones_segs(sec_ones_segs),
    .sec_tens_segs(sec_tens_segs),
    .min_segs(min_segs),
    .mag_on(mag_on)
);

always #10 clock = ~clock;

initial begin

    clock = 0;
    $dumpfile("microwave_oven.vcd");
    $dumpvars(0, test);

    // INICIALIZAÇÃO DO MICROONDAS 
    // (liga o microondas na tomada
        //(liga o clearn e desliga logo depois)
    clearn = 1'b0;
    #20;
    clearn = 1'b1;
        //('aperta' o botão 0 e solta)
    keypad = 10'b0000000001;
    #20;
    keypad = 10'b0000000000;


    // porta fechada, tudo desligado
    startn = 1'b1; stopn = 1'b1; clearn = 1'b1; door_closed = 1'b1;
    #500

    // insere 2 segundos
        // aperta 1
        keypad = 10'b0000000010;
        #100;
        // solta
        keypad = 10'b0000000000;
        #100;

        // aperta 0
        keypad = 10'b0100000000;
        #100;
        // solta
        keypad = 10'b0000000000;
        #100;

        // aperta 0
        keypad = 10'b0001000000;
        #100;
        // solta
        keypad = 10'b0000000000;
        #100;


   
    // aperta start
    startn = 0;
    #100;
    startn = 1;

    // teste de stopn
    #50;
    stopn = 0;
    #50;
    stopn = 1;

    #1000000;


 
    // aperta start
    startn = 0;
    #100;
    startn = 1;

    #5000;

    door_closed = 0;
    #10000;
    door_closed = 1;
    #50;
    startn = 0;
    #50;
    startn = 1;


    #1000;
    clearn = 0;
    #1000;
    clearn = 1;

    #1000;

    // insere 2 segundos
    // aperta 1
    keypad = 10'b0000000100;
    #100;
    // solta
    keypad = 10'b0000000000;
    #100;

    // aperta 0
    keypad = 10'b0000000001;
    #100;
    // solta
    keypad = 10'b0000000000;
    #100;

    // aperta start
    startn = 0;
    #100;
    startn = 1;

    #10000000;



    // // porta fechada, só startn ligado, tempo em 000
    // startn_tb = 1'b0; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
    // #50;

    // // porta fechada, 
    // startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
    // #50;

    // //
    // #10 startn_tb = 1'b1; stopn_tb = 1'b0; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;

    // #10 startn_tb = 1'b0; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
    // #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
    // #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b0; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
    // #10 startn_tb = 1'b0; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
    // #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
    // #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b0; timer_done_tb = 1'b0;
    // #10 startn_tb = 1'b0; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
    // #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
    // #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b1;
    // #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b1;

    $finish();
end

endmodule