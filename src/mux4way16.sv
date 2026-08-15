/**
 * 4-way 16-bit multiplexor:
 * out = a if sel = 00
 *       b if sel = 01
 *       c if sel = 10
 *       d if sel = 11
 */
module Mux4Way16 (
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [1:0] sel,
    output [15:0] out
);
    logic [15:0] aorb;
    logic [15:0] cord;
    Mux16 mux1 (
        .a(a),
        .b(b),
        .sel(sel[0]),
        .out(aorb)
    );
    Mux16 mux2 (
        .a(c),
        .b(d),
        .sel(sel[0]),
        .out(cord)
    );
    Mux16 mux3 (
        .a(aorb),
        .b(cord),
        .sel(sel[1]),
        .out(out)
    );


endmodule