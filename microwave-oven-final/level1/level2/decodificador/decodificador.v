`include "level2/decodificador/level3/decod47.v"

module decodificador(input  wire [3:0]sec_ones, 
                     input  wire [3:0]sec_tens, 
                     input  wire [3:0]min,
                     output wire [6:0]sec_ones_segs, 
                     output wire [6:0]sec_tens_segs, 
                     output wire [6:0]min_segs);
    decod47 U1 (.A(sec_ones[3]), .B(sec_ones[2]), .C(sec_ones[1]), .D(sec_ones[0]),
                .segs(sec_ones_segs));
    decod47 U2 (.A(sec_tens[3]), .B(sec_tens[2]), .C(sec_tens[1]), .D(sec_tens[0]),
                .segs(sec_tens_segs));
    decod47 U3 (.A(min[3]), .B(min[2]), .C(min[1]), .D(min[0]),
                .segs(min_segs));
endmodule