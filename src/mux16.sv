/**
 * 16-bit multiplexor: 
 * for i = 0, ..., 15:
 * if (sel = 0) out[i] = a[i], else out[i] = b[i]
 */

module Mux16 (
    input [15:0] a,
    input [15:0] b,
    input sel,
    output [15:0] out
);
    assign out = sel ? b : a;

endmodule