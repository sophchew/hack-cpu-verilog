/**
 * 8-way demultiplexor:
 * [a, b, c, d, e, f, g, h] = [in, 0,  0,  0,  0,  0,  0,  0] if sel = 000
 *                            [0, in,  0,  0,  0,  0,  0,  0] if sel = 001
 *                            [0,  0, in,  0,  0,  0,  0,  0] if sel = 010
 *                            [0,  0,  0, in,  0,  0,  0,  0] if sel = 011
 *                            [0,  0,  0,  0, in,  0,  0,  0] if sel = 100
 *                            [0,  0,  0,  0,  0, in,  0,  0] if sel = 101
 *                            [0,  0,  0,  0,  0,  0, in,  0] if sel = 110
 *                            [0,  0,  0,  0,  0,  0,  0, in] if sel = 111
 */
module DMux8Way (
    input in,
    input [2:0] sel,
    output a,
    output b,
    output c,
    output d,
    output e,
    output f,
    output g,
    output h
);
    logic abcd;
    logic efgh;

    DMux dmux1(
        .in(in),
        .sel(sel[2]),
        .a(abcd),
        .b(efgh)
    );

    DMux4Way dmux2(
        .in(abcd),
        .sel(sel[1:0]),
        .a(a),
        .b(b),
        .c(c),
        .d(d)
    );

    DMux4Way dmux3(
        .in(efgh),
        .sel(sel[1:0]),
        .a(e),
        .b(f),
        .c(g),
        .d(h)
    );

endmodule