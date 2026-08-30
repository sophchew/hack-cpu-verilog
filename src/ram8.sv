/**
 * Memory of eight 16-bit registers.
 * If load is asserted, the value of the register selected by
 * address is set to in; Otherwise, the value does not change.
 * The value of the selected register is emitted by out.
 */
module RAM8(
    input [15:0] in, 
    input load,
    input [2:0] address,
    input clk,
    output logic [15:0] out
);
    logic [15:0] registers [7:0]; // array of 8 16-bit registers
    always_ff @(posedge clk) begin
        if (load) begin
            registers[address] <= in;
        end

    end

    assign out = registers[address];

endmodule