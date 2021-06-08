module decod47_tb();
    reg A_tb, B_tb, C_tb, D_tb;
    wire [6:0]segs_tb;

    decod47 DUT(.A(A_tb), .B(B_tb), .C(C_tb), .D(D_tb), 
                .segs(segs_tb));
    initial begin
        $dumpfile("decod47_tb.vcd");
        $dumpvars(0, decod47_tb);

            A_tb = 1'b0; B_tb = 1'b0; C_tb = 1'b0; D_tb = 1'b0;
        #10 A_tb = 1'b0; B_tb = 1'b0; C_tb = 1'b0; D_tb = 1'b1;
        #10 A_tb = 1'b0; B_tb = 1'b0; C_tb = 1'b1; D_tb = 1'b0;
        #10 A_tb = 1'b0; B_tb = 1'b0; C_tb = 1'b1; D_tb = 1'b1;
        #10 A_tb = 1'b0; B_tb = 1'b1; C_tb = 1'b0; D_tb = 1'b0;
        #10 A_tb = 1'b0; B_tb = 1'b1; C_tb = 1'b0; D_tb = 1'b1;
        #10 A_tb = 1'b0; B_tb = 1'b1; C_tb = 1'b1; D_tb = 1'b0;
        #10 A_tb = 1'b0; B_tb = 1'b1; C_tb = 1'b1; D_tb = 1'b1;
        #10 A_tb = 1'b1; B_tb = 1'b0; C_tb = 1'b0; D_tb = 1'b0;
        #10 A_tb = 1'b1; B_tb = 1'b0; C_tb = 1'b0; D_tb = 1'b1;
        #10 A_tb = 1'b1; B_tb = 1'b0; C_tb = 1'b0; D_tb = 1'b1;
    end
endmodule