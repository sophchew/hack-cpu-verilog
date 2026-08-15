/**
 * Computes the sum of three bits.
 */
module FullAdder (
    input a, 
    input b,
    input c,
    output sum,
    output carry
);
    logic a_plus_b;
    logic carry_from_ab;
    logic carry_from_abc;
    HalfAdder half_adder1 (
        .a(a),
        .b(b),
        .sum(a_plus_b),
        .carry(carry_from_ab)
    );
    HalfAdder half_adder2 (
        .a(a_plus_b),
        .b(c),
        .sum(sum),
        .carry(carry_from_abc)
    );
    assign carry = carry_from_ab | carry_from_abc; // will never have both 1

endmodule