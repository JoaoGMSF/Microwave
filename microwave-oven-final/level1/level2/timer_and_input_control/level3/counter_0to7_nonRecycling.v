`timescale 1ms/1ms

module counter_0to7_nonRecycling(output reg out, input clear, clk);
  reg [2:0] counter; 

  always @(posedge clk)
    begin
      // checa se clear é 1, se for limpa o contador e zera out
      if(clear==1)
        begin
          counter <= 0;
          out <= 0;
        end
      else
        begin
        // se o contador for menor que 7, incrementa de 1
          if(counter < 7)
            begin
              counter = counter + 1;
              if(counter == 4)
                out <= 1;
            end
        end
    end
endmodule
