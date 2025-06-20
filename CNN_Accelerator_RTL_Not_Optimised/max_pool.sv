module max_pool #(parameter DATA_WIDTH = 8)(
    input logic [DATA_WIDTH-1:0] in0, in1, in2, in3,
    output logic [DATA_WIDTH-1:0] out
);
    assign out = (in0 > in1) ? (in0 > in2 ? (in0 > in3 ? in0 : in3) : (in2 > in3 ? in2 : in3)) :
                              (in1 > in2 ? (in1 > in3 ? in1 : in3) : (in2 > in3 ? in2 : in3));
endmodule