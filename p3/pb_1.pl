% 1. Write a predicate to generate the list of all subsets with all elements of a given list.
% Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]

% subseq(l1...ln, i) =
% 	• [], i = 0
% 	• l1 + subseq(l2...ln, i - 1), if i > 0
% 	• subseq(l2...ln, i), if i > 0

% subseq(L: list, i: number, R: list)
% (i, o)

subseq(_, 0, []).
subseq([H|T], I, [H|R]) :-
    I > 0,
    I1 is I - 1,
    subseq(T, I1, R).
subseq([_|T], I, R) :-
    I > 0,
    subseq(T, I, R).

% comb([1, 2, 3, 4], 2, R).

% allsolutions(L: list, N: number, R: list)
% allsolutions(i, i, o)

allsolutions(L, N, R) :-
    findall(RL, subseq(L, N, RL), R).

% allsolutions([2, 3, 4], 2, R).
% allsolutions([1, 2, 3, 4], 1, R).
% allsolutions([2, 3, 4, 6, 10], 3, R).
% allsolutions([2, 3, 4, 6, 10], 5, R).