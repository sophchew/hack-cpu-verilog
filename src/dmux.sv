/**
 * Demultiplexor:
 * [a, b] = [in, 0] if sel = 0
 *          [0, in] if sel = 1
 */

module DMux (
    input in,
    input sel,
    output a,
    output b
);

    assign a = sel ? 0 : in;
    assign b = sel ? in : 0;

endmodule