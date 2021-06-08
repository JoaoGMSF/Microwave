module controle_tb();
    reg startn_tb, stopn_tb, clrn_tb, door_closed_tb, timer_done_tb;
    wire S_tb, R_tb;

    controle DUT(.startn(startn_tb), .stopn(stopn_tb), .clrn(clrn_tb), 
                .door_closed(door_closed_tb), .timer_done(timer_done_tb), 
                .S(S_tb), .R(R_tb));
    initial begin
        $dumpfile("controle_tb.vcd");
        $dumpvars(0, controle_tb);

            startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
        #10 startn_tb = 1'b0; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
        #10 startn_tb = 1'b1; stopn_tb = 1'b0; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
        #10 startn_tb = 1'b0; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
        #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b0; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
        #10 startn_tb = 1'b0; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
        #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b0; timer_done_tb = 1'b0;
        #10 startn_tb = 1'b0; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b0;
        #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b1;
        #10 startn_tb = 1'b1; stopn_tb = 1'b1; clrn_tb = 1'b1; door_closed_tb = 1'b1; timer_done_tb = 1'b1;
    end
endmodule