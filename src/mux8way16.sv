/**
 * 8-way 16-bit multiplexor:
 * out = a if sel = 000
 *       b if sel = 001
 *       c if sel = 010
 *       d if sel = 011
 *       e if sel = 100
 *       f if sel = 101
 *       g if sel = 110
 *       h if sel = 111
 */

module Mux8Way16 (
    input [15:0] a,
    input [15:0] b,
    input [15:0] c,
    input [15:0] d,
    input [15:0] e,
    input [15:0] f,
    input [15:0] g,
    input [15:0] h,
    input [2:0] sel,
    output [15:0] out
 );
    logic [15:0] abcd;
    logic [15:0] efgh;

    Mux4Way16 mux1 (
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .sel(sel[1:0]),
        .out(abcd)
    );
    Mux4Way16 mux2 (
        .a(e),
        .b(f),
        .c(g),
        .d(h),
        .sel(sel[1:0]),
        .out(efgh)
    );
    Mux16 mux3 (
        .a(abcd),
        .b(efgh),
        .sel(sel[2]),
        .out(out)
    );

endmodule