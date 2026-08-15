/**
 * Computes the sum of two bits.
 0+0 = 0
 1+0 = 1
 0+1 = 1
 1+1 = 0 (carry = 1)

*/
module HalfAdder(
    input a,
    input b,
    output sum,
    output carry
);
    assign sum = a ^ b;
    assign carry = a & b;

endmodule