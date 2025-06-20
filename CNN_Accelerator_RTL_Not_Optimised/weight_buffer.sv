module weight_buffer #(parameter DATA_WIDTH = 8, parameter SIZE = 9)(
    input logic clk,
    input logic rst,
    input logic write_en,
    input logic [DATA_WIDTH-1:0] data_in,
    input logic [$clog2(SIZE)-1:0] write_addr,
    output logic [DATA_WIDTH-1:0] weights [0:SIZE-1]
);
    logic [DATA_WIDTH-1:0] buffer [0:SIZE-1];
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            for (int i = 0; i < SIZE; i++) buffer[i] <= 0;
        else if (write_en)
            buffer[write_addr] <= data_in;
    end
    assign weights = buffer;
endmodule