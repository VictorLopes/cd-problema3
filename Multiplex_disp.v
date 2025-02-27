module Multiplex_disp(clk, A, B, C, D, E, disp[7:0]);
	input clk, A, B, C, D, E;
	output [7:0] disp;
	
	not(neg_clk, clk);

	wire [7:0] anda;
	wire [7:0] pessoa;
	wire [7:0] disp0;
	wire [7:0] disp1;
		
	DecNumAndares andar(A, B, disp0);

	DecNumPessoas pessoas(C, D, E, disp1);

	// and habilita disp0 se clk e habilita disp1 se negclk 

	and(anda[0], disp0[0], clk);
	and(pessoa[0], disp1[0], neg_clk);
	or(disp[0], anda[0], pessoa[0]);

	and(anda[1], disp0[1], clk);
	and(pessoa[1], disp1[1], neg_clk);
	or(disp[1], anda[1], pessoa[1]);

	and(anda[2], disp0[2], clk);
	and(pessoa[2], disp1[2], neg_clk);
	or(disp[2], anda[2], pessoa[2]);

	and(anda[3], disp0[3], clk);
	and(pessoa[3], disp1[3], neg_clk);
	or(disp[3], anda[3], pessoa[3]);

	and(anda[4], disp0[4], clk);
	and(pessoa[4], disp1[4], neg_clk);
	or(disp[4], anda[4], pessoa[4]);

	and(anda[5], disp0[5], clk);
	and(pessoa[5], disp1[5], neg_clk);
	or(disp[5], anda[5], pessoa[5]);

	and(anda[6], disp0[6], clk);
	and(pessoa[6], disp1[6], neg_clk);
	or(disp[6], anda[6], pessoa[6]);

	and(anda[7], disp0[7], clk);
	and(pessoa[7], disp1[7], neg_clk);
	or(disp[7], anda[7], pessoa[7]);

endmodule