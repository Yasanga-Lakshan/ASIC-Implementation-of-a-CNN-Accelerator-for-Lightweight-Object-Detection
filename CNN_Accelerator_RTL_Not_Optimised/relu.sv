module relu #(parameter DATA_WIDTH = 16)(
    input logic signed [DATA_WIDTH-1:0] in,
    output logic signed [DATA_WIDTH-1:0] out
);
    assign out = (in > 0) ? in : 0;
endmodule