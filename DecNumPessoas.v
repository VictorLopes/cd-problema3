module DecNumPessoas(A, B, C, disp[7:0]);
	input A;
	input B;
	input C;
	output [7:0] disp;
	
	not(nC, C);
	not(nB, B);
	not(nA, A);

	and(anda0, A, nB,nC);
	and(anda1, nA, nB, C);
	or(disp[0], anda0, anda1);

	and(andb0, A, nB, C);
	and(andb1, A, B, nC);
	or(disp[1], andb0, andb1);

	and(disp[2], nA, B, nC);

	and(andd0, A, nB, nC);
	and(andd1, nA, nB, C);
	and(andd2, A, B, C); 
	or(disp[3], andd0, andd1, andd2);

	and(ande0, A, nB);
	or(disp[4], C, ande0);

	and(andf0, B, C); 
	and(andf1, nA, B);
	and(andf2, nA, C);
	or(disp[5], andf0, andf1, andf2);

	and(andg0, nA, nB);
	and(andg1, A, B, C);
	or(disp[6], andg0, andg1);

	not(disp[7], 0);

endmodule
