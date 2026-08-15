/**
 * ALU (Arithmetic Logic Unit):
 * Computes out = one of the following functions:
 *                0, 1, -1,
 *                x, y, !x, !y, -x, -y,
 *                x + 1, y + 1, x - 1, y - 1,
 *                x + y, x - y, y - x,
 *                x & y, x | y
 * on the 16-bit inputs x, y,
 * according to the input bits zx, nx, zy, ny, f, no.
 * In addition, computes the two output bits:
 * if (out == 0) zr = 1, else zr = 0
 * if (out < 0)  ng = 1, else ng = 0
 */
// Implementation: Manipulates the x and y inputs
// and operates on the resulting values, as follows:
// if (zx == 1) sets x = 0        // 16-bit constant
// if (nx == 1) sets x = !x       // bitwise not
// if (zy == 1) sets y = 0        // 16-bit constant
// if (ny == 1) sets y = !y       // bitwise not
// if (f == 1)  sets out = x + y  // integer 2's complement addition
// if (f == 0)  sets out = x & y  // bitwise and
// if (no == 1) sets out = !out   // bitwise not

module ALU (
    input [15:0] x,
    input [15:0] y,
    input zx, // zero x input?
    input nx, // negate x input?
    input zy, // zero y input?
    input ny, // negate y input?
    input f, // compute (out = x + y) or (out = x & y)?
    input no, // negate output?
    output logic [15:0] out,
    output logic zr,
    output logic ng
);
    logic [15:0] x_int;
    logic [15:0] y_int;
    always_comb begin

        if (zx) begin
            x_int = 16'b0;
        end else begin
            x_int = x;
        end

        if (nx) begin
            x_int = ~x_int;
        end

        if (zy) begin
            y_int = 16'b0;
        end else begin
            y_int = y;
        end

        if (ny) begin
            y_int = ~y_int;
        end

        if (f) begin
            out = x_int + y_int;
        end else begin
            out = x_int & y_int;
        end

        if (no) begin
            out = ~out;
        end
        
        zr = (out == 16'b0);

        ng = out[15]; // two's complement has sign bit
         

    end

endmodule