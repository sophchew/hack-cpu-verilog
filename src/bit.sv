/**
 * 1-bit register:
 * If load is asserted, the register's value is set to in;
 * Otherwise, the register maintains its current value:
 * if (load(t)) out(t+1) = in(t), else out(t+1) = out(t)
 */
module Bit (
    input in,
    input load,
    input clk,
    output logic out
);
    always_ff @(posedge clk) begin
        if (load) begin
            out <= in;
        end
        
    end


endmodule