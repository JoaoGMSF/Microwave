module decodificador_tb();
    reg [3:0]sec_ones_tb; 
    reg [3:0]sec_tens_tb; 
    reg [3:0]min_tb;
    wire [6:0]sec_ones_segs_tb; 
    wire [6:0]sec_tens_segs_tb; 
    wire [6:0]min_segs_tb;

    decodificador DUT(.sec_ones(sec_ones_tb), .sec_tens(sec_tens_tb), .min(min_tb), 
                .sec_ones_segs(sec_ones_segs_tb), .sec_tens_segs(sec_tens_segs_tb),
                .min_segs(min_segs_tb));
    initial begin
        $dumpfile("decodificador_tb.vcd");
        $dumpvars(0, decodificador_tb);

            sec_ones_tb = 'h8; sec_tens_tb = 'h9; min_tb = 'h0;
        #10 sec_ones_tb = 'h9; sec_tens_tb = 'h0; min_tb = 'h1;
        #10 sec_ones_tb = 'h0; sec_tens_tb = 'h1; min_tb = 'h2;
        #10 sec_ones_tb = 'h1; sec_tens_tb = 'h2; min_tb = 'h3;
        #10 sec_ones_tb = 'h2; sec_tens_tb = 'h3; min_tb = 'h4;
        #10 sec_ones_tb = 'h3; sec_tens_tb = 'h4; min_tb = 'h5;
        #10 sec_ones_tb = 'h4; sec_tens_tb = 'h5; min_tb = 'h6;
        #10 sec_ones_tb = 'h5; sec_tens_tb = 'h6; min_tb = 'h7;
        #10 sec_ones_tb = 'h6; sec_tens_tb = 'h7; min_tb = 'h8;
        #10 sec_ones_tb = 'h7; sec_tens_tb = 'h8; min_tb = 'h9;
        #10 sec_ones_tb = 'h7; sec_tens_tb = 'h8; min_tb = 'h9;
    end
endmodule