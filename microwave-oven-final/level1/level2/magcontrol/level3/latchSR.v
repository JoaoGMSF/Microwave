module latchSR(input  wire S, R,
               output wire Q, Qn);

    assign Q = !(R || Qn);
    assign Qn = !(S || Q);

endmodule