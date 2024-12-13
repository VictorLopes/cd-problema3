module DecNumAndares(A, B, disp[7:0]);
	input A;
	input B;
	output [7:0] disp;

	//wire [7:0] disp;
	wire nA, nB;
	not(nB, B);
	not(nA, A);

	and(disp[0], nA, nB);

	not(disp[1], 1);

	not(disp[2], nB);

	and(disp[3], nA, nB);

	not(disp[4], B);

	not(disp[5], 0);

	and(disp[6], nA, nB);

	not(disp[7], 0);

endmodule
