/* 
 * Esse módulo tem como objetivo definir qual a prioridade de subida ou descida do elevador de acordo com
 * as chaves acionadas vs o estado atual do elevador. Ex.: Se o elevador estiver no primeiro andar e a chave
 * do terceiro andar for acionada, uma máquina de estados deve fazer essa transição e definir que o elevador
 * deve ir para o terceiro andar 
 */
module Elevador(
	input A0, // andar 1
	input A1, // andar 2
	input A2, // andar 3
	input C, // 1 = elevador cheio
	
	input BA0, // bit andar 0
	input BA1, // bit andar 1
	
	input clk, // de um segundo recebendo do divisorclock
	input reset, // botao B3
	output [1:0] saida
);

	reg [1:0] state, nextstate;

	not(nreset, reset);
	// state code
	parameter S0 = 2'b00;
	parameter S1 = 2'b01;
	parameter S2 = 2'b10;

	// state register
	always @(posedge clk, posedge nreset)
	
	if ( nreset ) state <= S0 ;
		else state <= nextstate ;
		// next state logic
	always @ (*)
		case (state)
			S0 : begin if ((A1 || A2) && ((BA0 && ~BA1) || (~BA0 && BA1)) && ~C) nextstate = S1;
			else nextstate = S0;
			end
			
			S1 : begin if (A0 && ~A1 && ~A2 && ~BA0 && ~BA1 && ~C) nextstate = S0;
			else if (~A0 && ~A1 && A2 && BA0 && ~BA1 && ~C) nextstate = S2;
			else nextstate = S1;
			end
			
			S2 : begin if ((A0 || A1) && ((~BA0 && ~BA1) || (~BA0 && BA1)) && ~C) nextstate = S1;
			else nextstate = S2;
			end
		endcase
	
	// output logic
	assign saida = state;
endmodule