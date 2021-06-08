module latchSR_tb();
    reg S_tb, R_tb;
    wire Q_tb, Qn_tb;

    latchSR DUT(.S(S_tb), .R(R_tb), .Q(Q_tb), .Qn(Qn_tb));
    initial begin
        $dumpfile("latchSR_tb.vcd");
        $dumpvars(0, latchSR_tb);

            S_tb = 1'b0; R_tb = 1'b0;
        #10 S_tb = 1'b0; R_tb = 1'b1;
        #10 S_tb = 1'b0; R_tb = 1'b0;
        #10 S_tb = 1'b1; R_tb = 1'b0;
        #10 S_tb = 1'b0; R_tb = 1'b0;
        #10 S_tb = 1'b1; R_tb = 1'b1;
        #10 S_tb = 1'b1; R_tb = 1'b1;
    end
endmodule