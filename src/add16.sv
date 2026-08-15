/**
 * 16-bit adder: Adds two 16-bit two's complement values.
 * The most significant carry bit is ignored.
 */
module Add16(
    input [15:0] a,
    input [15:0] b,
    output [15:0] out
);
    assign out = a + b;
    /** Note: At gate level, if using full adder + half adder logic, 
    we would use half adder to add first bits, 
    then subsequently use full adders to sum each bit and carry bit.
    */
endmodule