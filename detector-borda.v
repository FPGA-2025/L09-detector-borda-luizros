module detector_borda (
    input clk,
    input rst,
    input [1:0] entrada,
    output reg [1:0] detector
);

    reg [1:0] entrada_delay;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset assíncrono: zera os registradores
            entrada_delay <= 2'b00;
            detector <= 2'b00;
        end else begin
            // Detecta borda de subida
            detector <= (~entrada_delay & entrada);
            entrada_delay <= entrada;
        end
    end

endmodule