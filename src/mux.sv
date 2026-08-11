/** 
 * Multiplexor:
 * if (sel = 0) out = a, else out = b
 */
module Mux (
    input a, 
    input b, 
    input sel,
    output out
);
    assign out = sel ? b : a;

endmodule