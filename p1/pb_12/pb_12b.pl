% 12
% b. Remove the n-th element of a list
% 
% we go recursively through the list until we reach the k position wanted. if k is one, then we have just the tail, otherwise
% append the head list and the rest of the list without the element on the kth position.
% 
% remove_nth(l1...ln, k) =
% 	• [], if n = 0
% 	• l2...ln, if k = 1
% 	• l1 ∪ remove_nth(l2...ln, k - 1), otherwise 
% 	
% remove_nth(L:list, K:number, R:list)
% flow model: (i, i, o)

remove_nth([], _, []).
remove_nth([_|T], 1, T).
remove_nth([H|T], K, [H|R]) :-
    K1 is K - 1,
    remove_nth(T, K1, R).

% remove_nth([5, 6, 7, 3, 1, 10], 3, R).
% remove_nth([], 3, R).
% remove_nth([5, 6, 7, 3, 1, 10], 1, R).