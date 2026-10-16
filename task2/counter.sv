module counter #(
    parameter WIDTH = 8
)(
    // interface signals
    input logic              clk, // clock
    input logic              rst, // reset
    input logic              en, // count direction: 1 = up, 0 = down
    output logic [WIDTH-1:0] count // count output
);

always_ff @ (posedge clk)
    if (rst) count <= {WIDTH{1'b0}};
    else if (en) count <= count + 1'b1;
    else         count <= count - 1'b1;

endmodule 
