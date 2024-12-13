/*
 * Modulo responsável em traduzir as chamadas internas e externas em uma chamada global
 * cujas saídas serão acopladas no módulo de Andar
 */
module Chamada(
	input AI0, // Chave 0 para chamada interna
	input AI1, // Chave 1 para chamada interna
	input AI2, // Chave 2 para chamada interna
	input AE0, // Chave 0 para chamada externa
	input AE1, // Chave 1 para chamada externa
	input AE2, // Chave 2 para chamada externa
	output A0,
	output A1,
	output A2
);
	assign A0 = AI0 || AE0;
	assign A1 = AI1 || AE1;
	assign A2 = AI2 || AE2;	
endmodule
