module mac_unit #(parameter DATA_WIDTH = 8)(
    input logic signed [DATA_WIDTH-1:0] a,
    input logic signed [DATA_WIDTH-1:0] b,
    input logic signed [2*DATA_WIDTH-1:0] acc_in,
    output logic signed [2*DATA_WIDTH-1:0] acc_out
);
    assign acc_out = acc_in + a * b;
endmodule