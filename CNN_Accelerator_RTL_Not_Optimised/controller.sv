module controller (
    input logic clk,
    input logic rst,
    output logic start_conv,
    output logic done
);
    typedef enum logic [1:0] {IDLE, LOAD, CONV, DONE} state_t;
    state_t state, next_state;
    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end
    always_comb begin
        next_state = state;
        start_conv = 0;
        done = 0;
        case (state)
            IDLE: next_state = LOAD;
            LOAD: next_state = CONV;
            CONV: begin start_conv = 1; next_state = DONE; end
            DONE: done = 1;
        endcase
    end
endmodule