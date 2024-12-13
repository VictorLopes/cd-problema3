module Pessoas(
	input P, // porta 0 pra fechada e 1 para aberta
	input B1, // botao remove pessoa
	input B2, // botao adiciona pessoa
	input clk, // de um segundo recebendo do divisorclock
	input reset, // botao B3
	output C, // Cheio
	output [2:0] saida
);
	reg [2:0] state, nextstate;

	not(negB1, B1);
	not(negB2, B2);
	not(nreset, reset);
	not(nP, P);
// 5 -> limit peoples
	// state code
	parameter S0 = 3'b000; // 0 peoples
	parameter S1 = 3'b001; // 1 peoples
	parameter S2 = 3'b010; // 2 peoples
	parameter S3 = 3'b011; // 3 peoples
	parameter S4 = 3'b100; // 4 peoples
	parameter S5 = 3'b101; // 5 peoples
	parameter S6 = 3'b110; // 6 peoples
	parameter S7 = 3'b111; // 7 peoples
	
	// state register
	always @(posedge clk, posedge nreset)
	
	if ( nreset ) state <= S0 ;
		else state <= nextstate ;
		// next state logic
	always @ (*)
		case (state)
			S0 : begin if (negB1 && P) nextstate = S1;
			else if (negB2 && P) nextstate = S0;
			else nextstate = S0;
			end
			
			S1 : begin if (negB1 && P) nextstate = S2;
			else if (negB2 && P) nextstate = S0;
			else nextstate = S1;
			end
			
			S2 : begin if (negB1 && P) nextstate = S3;
			else if (negB2 && P) nextstate = S1;
			else nextstate = S2;
			end
			
			S3 : begin if (negB1 && P) nextstate = S4;
			else if (negB2 && P) nextstate = S2;
			else nextstate = S3;
			end
			
			S4 : begin if (negB1 && P) nextstate = S5;
			else if (negB2 && P) nextstate = S3;
			else nextstate = S4;
			end
			
			S5 : begin if (negB1 && P) nextstate = S6;
			else if (negB2 && P) nextstate = S4;
			else nextstate = S5;
			end
			
			S6 : begin if (negB1 && P) nextstate = S7;
			else if (negB2 && P) nextstate = S5; 
			else nextstate = S6;
			end
			
			S7 : begin if (negB1 && P) nextstate = S7;
			else if (negB2 && P) nextstate = S6;
			else nextstate = S7;
			end
			
		endcase
	
	// output logic
	assign saida = state;
	assign C = state == S7; // elevador cheio

	
	endmodule
