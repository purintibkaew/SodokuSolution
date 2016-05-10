:- use_module(library(clpfd)).

sudoku(Rows) :-
	append(Rows, Values), Values ins 1..9,
	maplist(all_distinct, Rows),
	transpose(Rows, Columns),
	maplist(all_distinct, Columns),
	Rows = [A,B,C,D,E,F,G,H,I],
	box(A, B, C), box(D, E, F), box(G, H, I),
	maplist(label, Rows).

box([], [], []).
box([A,B,C|Rest1], [D,E,F|Rest2], [G,H,I|Rest3]) :-
	all_distinct([A,B,C,D,E,F,G,H,I]),
	box(Rest1, Rest2, Rest3).
