module conv2d_core #(parameter DATA_WIDTH = 8)(
    input logic clk,
    input logic rst,
    input logic [DATA_WIDTH-1:0] input_window [0:8],
    input logic [DATA_WIDTH-1:0] weights [0:8],
    output logic signed [2*DATA_WIDTH-1:0] conv_out
);
    logic signed [2*DATA_WIDTH-1:0] acc, acc_next;
    always_comb begin
        acc_next = 0;
        for (int i = 0; i < 9; i++) begin
            acc_next += $signed(input_window[i]) * $signed(weights[i]);
        end
    end
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            acc <= 0;
        else
            acc <= acc_next;
    end
    assign conv_out = acc;
endmodule