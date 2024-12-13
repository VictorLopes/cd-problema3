module DivisorClock1(clock_in, clock_out);

input clock_in;          // Input clock on FPGA
output reg clock_out;    // Output clock after dividing the input clock by divisor
reg[11:0] counter = 12'b000000000000;  // 25-bit counter
reg[11:0] counter_fin = 12'b111111111110;  // 25 million in binary (final count)

always @(posedge clock_in) begin
    if (counter < counter_fin) begin
        counter <= counter + 1'b1;  // Increment the counter
    end else begin
        counter <= 12'b000000000000; // Reset counter to zero
        clock_out <= ~clock_out;  // Toggle clock_out
    end
end

endmodule
