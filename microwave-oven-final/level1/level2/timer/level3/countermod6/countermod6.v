module counter_mod6(output reg [3:0] ones,
                     output wire tc, zero,
                     input wire [3:0] data,
                     input wire loadn, clrn, clock, enable);

assign tc = (enable && (ones==0));
assign zero = (ones==0);

always @(posedge clock or negedge clrn) 
begin
  if(!clrn)
    ones <= 0;
  else if(!loadn)
    ones <= data;
  else 
  begin
    if (enable)
    begin
        if(ones==0)
            ones<=5;
        else
          ones<=ones-1;        
    end   
  end
end

endmodule