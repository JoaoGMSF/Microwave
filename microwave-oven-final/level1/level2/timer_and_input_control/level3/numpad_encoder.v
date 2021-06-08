`timescale 1ms/1ms

module numpad_encoder(
  output reg  [3:0] BCDout ,
  output wire validData,
  input enablen,
  input [9:0] numpad
);
  
  assign validData = (numpad==10'b0000000000) ? 1 : 0;

  always @*
  // se enablen ligado
  if(enablen == 0)
    begin
      // if(numpad == 10'b0000000000) // se nenhuma tecla estiver on
      //   validData = 1;
      // else						  // se alguma tela estiver on
      //   begin
      //   validData = 0;
          // a depender da telca que estiver on, envia em bcd
          if(numpad == 10'b0000000001) // tecla 0
            BCDout = 4'b0000;
          else if(numpad == 10'b0000000010) // tecla 1
            BCDout = 4'b0001;
          else if(numpad == 10'b0000000100) // tecla 2
            BCDout = 4'b0010;
          else if(numpad == 10'b0000001000) // tecla 3
            BCDout = 4'b0011;
          else if(numpad == 10'b0000010000) // tecla 4
            BCDout = 4'b0100;
          else if(numpad == 10'b0000100000) // tecla 5
            BCDout = 4'b0101;
          else if(numpad == 10'b0001000000) // tecla 6
            BCDout = 4'b0110;
          else if(numpad == 10'b0010000000) // tecla 7
            BCDout = 4'b0111;
          else if(numpad == 10'b0100000000) // tecla 8
            BCDout = 4'b1000;
          else if(numpad == 10'b1000000000) // tecla 9
            BCDout = 4'b1001;
          else
            BCDout = 4'b0000;
        end
    // end
  // se enablen desligado
    // validData = 1;
    
  
endmodule
