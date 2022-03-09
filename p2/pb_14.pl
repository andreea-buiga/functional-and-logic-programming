% 14.
% a. Define a predicate to determine the longest sequences of consecutive even numbers (if exist more 
% maximal sequences one of them).

% Model:
% isEven(n) =
% 	• true, n % 2 = 0
% 	• false, otherwise
% isEven(N: number)
% flow model: (i)

isEven(N):-
    N mod 2 =:= 0.

% isEven(8).
% isEven(7).

% Model:
% addElement(l1...ln, e) =
% 	• [e], n = 0
% 	• l1 + addElement(l2...ln), otherwise

% addElement(L: list, E: number, R: list)
% flow model: (i, i, o)

addElement([], E, [E]).
addElement([H|T], E, [H|R]):-
    addElement(T, E, R).

% addElement([1, 5, 2, 4], 9, R).
% addElement([], 9, R).

% Model:
% getLength(l1...ln) =
% 	• 0, n = 0
% 	• 1 + getLength(l2...ln), otherwise

% getLength(L: list, R: number)
% flow model: (i, o)

getLength([], 0).
getLength([_|T], R):-
    getLength(T, R2),
    R is R2 + 1.

% getLength([1, 6, 7], R).
% getLength([], R).

% Model:
% consecutive(l1...ln, c1...cm, a1...al) =
% 	• a1...al, n = 0, l > m
% 	• c1...cm, n = 0, l < m
% 	• consecutive(l2...ln, c1...cm, l1 + r1...rl), even(l1) = true
% 	• consecutive(l2...ln, a1...al, []), even(l1) = false and l > m
% 	• consecutive(l2...ln, c1...cm, []), even(l1) = false and l < m

% consecutive(L: list, C: list, AUX: list, R: list)
% consecutive(i, i, i, o)

consecutive([], C, AUX, C):-
    getLength(C, LC),
    getLength(AUX, LAUX),
    LC >= LAUX, !.
consecutive([], C, AUX, AUX):-
    getLength(C, LC),
    getLength(AUX, LAUX),
    LC < LAUX, !.
consecutive([H|T], C, AUX, R):- 
    isEven(H), !,
    addElement(AUX, H, RA),
    consecutive(T, C, RA, R).
consecutive([_|T], C, AUX, R):-
    getLength(C, LC),
    getLength(AUX, LAUX),
    LAUX >= LC, !,
    consecutive(T, AUX, [], R).
consecutive([_|T], C, AUX, R):-
    getLength(C, LC),
    getLength(AUX, LAUX),
    LAUX < LC, !,
    consecutive(T, C, [], R).

consecutive_main(L, R):-
    consecutive(L, [], [], R).

% consecutive_main([1, 7, 2, 6, 8, 10, 11, 13], R).
% consecutive_main([1, 2, 4, 6, 7, 8, 10, 12], R).
% consecutive_main([1, 7, 11, 13], R).


% b. For a heterogeneous list, formed from integer numbers and list of numbers, 
% define a predicate to replace every sublist with the longest sequences of even numbers from that sublist.
% Eg.: [1, [2, 1, 4, 6, 7], 5, [1, 2, 3, 4], 2, [1, 4, 6, 8, 3], 2, [1, 5], 3] =>
% [1, [4, 6], 5, [2], 2, [4, 6, 8], 2, [], 3]

% Model:
% heterList(l1...ln, list) = 
% 	• [], n = 0
% 	• consecutive(l1, [], []) + heterList(l2...ln), is_list(l1) = True
% 	• l1 + heterList(l2...ln), otherwise

% heterList(L: list, R: list)
% flow model: (i, o)

heterList([], []).
heterList([H|T], [HR|R]):- 
    is_list(H), !,
    consecutive(H, [], [], HR),
    heterList(T, R).
heterList([H|T], [H|R]) :-
    heterList(T, R).

% heterList([1, [2, 1, 4, 6, 7], 5, [1, 2, 3, 4], 2, [1, 4, 6, 8, 3], 2, [1, 5], 3], R).