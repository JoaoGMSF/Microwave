module controle (input  wire startn, stopn, clrn, door_closed, timer_done,
                 output wire S, R);
    assign S = !startn; // && door_closed && !timer_done && clrn && stopn;
    assign R = !door_closed || timer_done || !clrn || !stopn; 

    // assign R = !door_closed || timer_done^!startn || !clrn || !stopn; 

endmodule