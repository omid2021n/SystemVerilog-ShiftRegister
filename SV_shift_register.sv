module ShiftRegister #(
    parameter bit ROTATE_TO_RIGHT = 1,
    parameter int PEEK_INDEX      = 0,
    parameter int N               = 8
) (
    input  logic             rst,
    input  logic             clk,

    input  logic             load_sr,
    input  logic [N-1:0]     load_value,

    input  int               bits_to_shift,
    input  logic             shift_sr,

    output logic             serial_out,
    output logic             peek_value,

    output logic             all_bits_shifted
);

    logic [N-1:0] sr;
    int           bit_counter;

    assign peek_value = sr[PEEK_INDEX];

    generate
      if (ROTATE_TO_RIGHT) begin : ROTATE_SR_RIGHT

            assign serial_out = sr[0];

            // Right shift operation
            always_ff @(posedge clk or posedge rst) begin
                if (rst) begin
                    sr <= '0;
                end else begin
                    if (load_sr) begin
                        sr <= load_value;
                    end else if (shift_sr) begin
                        sr <= {sr[0], sr[N-1:1]};
                    end
                end
            end

        end else begin : ROTATE_SR_LEFT

            assign serial_out = sr[N-1];

            // Left shift operation
            always_ff @(posedge clk or posedge rst) begin
                if (rst) begin
                    sr <= '0;
                end else begin
                    if (load_sr) begin
                        sr <= load_value;
                    end else if (shift_sr) begin
                        sr <= {sr[N-2:0], sr[N-1]};
                    end
                end
            end

        end
    endgenerate


    always_ff @(posedge clk or posedge rst) begin : CountTheBits
        if (rst) begin
            bit_counter      <= 0;
            all_bits_shifted <= 1'b0;
        end else begin
            if (load_sr) begin
                bit_counter <= bits_to_shift;
            end else if (shift_sr) begin
                bit_counter <= bit_counter - 1;
            end

            if (bit_counter == 0) begin
                all_bits_shifted <= 1'b1;
            end else begin
                all_bits_shifted <= 1'b0;
            end
        end
    end

endmodule
