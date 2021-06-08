`timescale 1ms/1ms 
`include "timer_input_and_control_module.v"


module test;

    wire [3:0] D;
    wire loadn;
    wire pgt_1Hz;
    reg [9:0] numpad;
    reg enablen;
    reg clock_100Hz;

    timer_input_and_control_module modulo(
        .D(D),
        .loadn(loadn),
        .pgt_1Hz(pgt_1Hz),
        .numpad(numpad),
        .enablen(enablen),
        .clock_100Hz(clock_100Hz)
    );


 always #5 clock_100Hz <= ~clock_100Hz;

 initial begin
   clock_100Hz = 1;

   $dumpfile("test.vcd");
   $dumpvars(0,test);
   
   // teste do enablen
   enablen = 1;
   numpad = 10'b0000000000;
   #10; // validData == 1; BCDout == X
   numpad = 10'b0000000001;
   #10; // validData == 1; BCDout == X
   
   // teste apertando os botões
   enablen = 0;
   numpad = 10'b0000000000;
   #10; // validData == 1; BCDout == X
   	// embaixo, validData == 0; BCDout == *conversão*
   numpad = 10'b0000000001;
   #300;

   numpad = 10'b0000000000; // tira o dedo do botão
   #100;

   numpad = 10'b0000000010;
   #300;
//    numpad = 10'b0000000100;
//    #100;
//    numpad = 10'b0000001000;
//    #100;
//    numpad = 10'b0000010000;
//    #100;
//    numpad = 10'b0000100000;
//    #100;
//    numpad = 10'b0001000000;
//    #100;
//    numpad = 10'b0010000000;
//    #100;
//    numpad = 10'b0100000000;
//    #100;
//    numpad = 10'b1000000000;
//    #100;
   
//    // agora, não aperta nenhum botão
//    numpad = 10'b0000000000;
//    #100; 
   
//    // aperta um botão aleatório e solta pra testar
//    numpad = 10'b0000010000;
//    #100;
//    numpad = 10'b0000000000;
//    #100;
   

   $finish();

 end

endmodule