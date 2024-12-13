/*
 * Esse módulo realiza a transição de estados da porta quando os bits do andar e da prioridade forem "iguais".
 */

module Porta(	
	input BA0, // bit andar 0
	input BA1, // bit andar 1
	
	input BP0, // bit prioridade 0
	input BP1, // bit prioridade 1
	
	input C, // 1 = elevador cheio
	
	input clk, // de um segundo recebendo do divisorclock
	input reset, // botao B3
	output P,
	output [1:0] saida
);

	reg [1:0] state, nextstate;

	not(nreset, reset);
	// state code
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;
	parameter S3 = 2'b11;

	// state register
	always @(posedge clk, posedge nreset)
	
	if ( nreset ) state <= S0 ;
		else state <= nextstate ;
		// next state logic
	always @ (*)
		case (state)
			S0 : begin if (BA0 == BP0 && BA1 == BP1) nextstate = S1;
			else if (C) nextstate = S1;
			else nextstate = S0;
			end
		
			S1 : begin if (BA0 == BP0 && BA1 == BP1 && ~C) nextstate = S2;
			else if (C) nextstate = S2;
			else nextstate = S0;
			end
			
			S2 : begin if (BA0 == BP0 && BA1 == BP1 && ~C) nextstate = S3;
			else if (C) nextstate = S3;
			else nextstate = S1;
			end
			
			S3 : begin if (BA0 == BP0 && BA1 == BP1 && ~C) nextstate = S3;
			else if (C) nextstate = S3;
			else nextstate = S2;
			end

		endcase
	
	// output logic
	assign saida = state;
	assign P = state == S3; // porta aberta

endmodule
