module Andar(
	input P, // porta 0 pra fechada e 1 para aberta
	
	input A0, // andar 1
	input A1, // andar 2
	input A2, // andar 3
	
	input clk, // de um segundo recebendo do divisorclock
	input reset, // botao B3
	output [1:0] mot, // led 1 para funcionamento do motor 
	output [1:0] saida
);
	reg [1:0] state, nextstate;
	
	not(nreset, reset);
	// state code
	parameter S0 = 2'b00; // Primeiro andar
	parameter S1 = 2'b01; // Segundo andar
	parameter S2 = 2'b10; // Terceiro andar

	// state register
	always @(posedge clk, posedge nreset)
	
	if ( nreset ) state <= S0 ;
		else state <= nextstate ;
		// next state logic
	always @ (*)
		case (state)
			S0 : begin if ((~A0 && A1 && ~A2) && ~P) nextstate = S1;
			else if ((~A0 && ~A1 && A2) && ~P) nextstate = S1;
			else if ((~A0 && A1 && A2) && ~P) nextstate = S1;
			else nextstate = S0;
			end
			
			S1 : begin if ((~A0 && ~A1 && A2) && ~P) nextstate = S2;
			else if ((A0 && ~A1 && ~A2) && ~P) nextstate = S0;
			else if ((A0 && ~A1 && A2) && ~P) nextstate = S0;
			else nextstate = S1;
			end
			
			S2 : begin if ((~A0 && A1 && ~A2) && ~P) nextstate = S1;
			else if ((A0 && ~A1 && ~A2) && ~P) nextstate = S1;
			else if ((A0 && A1 && ~A2) && ~P) nextstate = S1;
			else nextstate = S2;
			end
		endcase
	
	// output logic
	assign saida = state;
// 01 estado de subida, 10 estado de descida
	assign mot[0] = (state == S0 && nextstate == S1) || (state == S1 && nextstate == S2); // subindo
	assign mot[1] = (state == S2  && nextstate == S1) || (state == S1 && nextstate == S0); // descendo
	
endmodule
