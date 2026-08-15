/**
 * 4-way demultiplexor:
 * [a, b, c, d] = [in, 0, 0, 0] if sel = 00
 *                [0, in, 0, 0] if sel = 01
 *                [0, 0, in, 0] if sel = 10
 *                [0, 0, 0, in] if sel = 11
 */
module DMux4Way(
    input in,
    input [1:0] sel,
    output a,
    output b,
    output c,
    output d
);
    logic ab;
    logic cd;
    
    DMux dmux1 (
        .in(in),
        .sel(sel[1]),
        .a(ab),
        .b(cd)
    );

    DMux dmux2 (
        .in(ab),
        .sel(sel[0]),
        .a(a),
        .b(b)
    );

    DMux dmux3 (
        .in(cd),
        .sel(sel[0]),
        .a(c),
        .b(d)
    );


endmodule