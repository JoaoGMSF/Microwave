`timescale 1ms/1ms
`include "numpad_encoder.v"

module test;

  reg validData, enablen;
  reg [3:0] BCDout;
  reg [9:0] numpad;

  NUMPAD_ENCODER encoder(
    .BCDout(BCDout),
    .validData(validData),
    .enablen(enablen),
    .numpad(numpad)
  );

 initial begin
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
   #10;
   numpad = 10'b0000000010;
   #10;
   numpad = 10'b0000000100;
   #10;
   numpad = 10'b0000001000;
   #10;
   numpad = 10'b0000010000;
   #10;
   numpad = 10'b0000100000;
   #10;
   numpad = 10'b0001000000;
   #10;
   numpad = 10'b0010000000;
   #10;
   numpad = 10'b0100000000;
   #10;
   numpad = 10'b1000000000;
   #10;
   
   // agora, não aperta nenhum botão
   numpad = 10'b0000000000;
   #10; 
   
   // aperta um botão aleatório e solta pra testar
   numpad = 10'b0000010000;
   #10;
   numpad = 10'b0000000000;
   #10;
   
 end
  
endmodule
