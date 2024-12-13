module DecSeletor(S, Y[3:0]);
	input S;
	output [3:0] Y;
	
and(Y[0], S, 1);
not(Y[1], 0);
not(Y[2], 0);
not(Y[3], S);

endmodule


