module Main(clk, AI1, AI2, AI3, AE1, AE2, AE3, B1, B2, reset0, disp[7:0], Y[3:0], C, P, port[3:0], saidaMot[1:0]);
	input clk, AI1, AI2, AI3, AE1, AE2, AE3, B1, B2, reset0;
	output [7:0] disp;
	output [3:0] Y;
	output [3:0] port;
	output [1:0] saidaMot;
	output C;
	output P;
	
	
	//DivisorClock faz1s(clk, clkot);
	
	//Pessoas maq1(A
	
	wire A1, A2, A3;
	Chamada chamada(AI1, AI2, AI3, AE1, AE2, AE3, A1, A2, A3);
	
	
	DivisorClock divisor1s(clk, clkot0);
	
	DivisorClock1 fazmux(clk, clkot1);
	
	wire [1:0] saidaAndar;
	wire [1:0] saidaMot;
	Andar andar(0, A1, A2, A3, clkot0, reset0, saidaMot, saidaAndar);
	
	wire [1:0] saidaElevador;
	Elevador elevador(A1, A2, A3, C, saidaAndar[1], saidaAndar[0], clkot0, reset0, saidaElevador);
	
	assign BIT0 = saidaElevador[1];
	assign BIT1 = saidaElevador[0];
	
	wire [1:0] saidaPorta;
	Porta porta(saidaAndar[1], saidaAndar[0], saidaElevador[1], saidaElevador[0], C, clkot0, reset0, P, saidaPorta);
	
	assign port[0] = saidaPorta[1];
	assign port[3] = saidaPorta[1];
	assign port[1] = saidaPorta[0];
	assign port[2] = saidaPorta[0];
	
	wire [2:0] saidaPessoas;
	Pessoas pessoas(P, B1, B2, clkot0, reset0, C, saidaPessoas[2:0]);
	
	DecSeletor selciona(clkot1, Y);
	
	Multiplex_disp multiplexe(clkot1, saidaElevador[1], saidaElevador[0], saidaPessoas[2], saidaPessoas[1], saidaPessoas[0], disp);

endmodule


