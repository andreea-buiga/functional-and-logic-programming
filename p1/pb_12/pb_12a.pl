% 12.
% a. Write a predicate to substitute in a list a value with all the elements of another list.
% 
% appending two list with each other.
% 
% insert_list(l1...ln, list) =
% 	list, if n = 0
% 	l1 ∪ insert_list(l2...ln, list), otherwise
% 	
% insert_list(L: list, List: list, R: list)
% flow model: (i, i, o)

insert_list([], L, L).
insert_list([H|T], L, [H|R]):- 
    insert_list(T, L, R).

% insert_list([], [1, 2], R).
% insert_list([8, 8, 7], [1, 2], R).

% we seach the element value where we want to insert the list then call the previously defined function to add the list
% just before the element and then append what is after the element.
% 
% substitute_elem(l1...ln, e, list) =
% 	[], if n = 0
% 	substitute_elem(insert_list(list, l2...ln), e, list), if l1 = e
% 	l1 ∪ substitute_elem(l2...ln, e, list), otherwise (l1 != e)
% 	
% substitute_elem(L:list, E:number, List:list, R:list)
% flow model: (i, i, i, o)

substitute_elem([], _, _, []).
substitute_elem([H|T], E, List, R) :- 
    H =:= E,
    insert_list(List, T, RI),
    substitute_elem(RI, E, List, R).
substitute_elem([H|T], E, List, [H|R]) :- 
    H =\= E,
    substitute_elem(T, E, List, R).

% substitute_elem([1, 5, 5, 3, 6, 5], 5, [4, 9, 8, 10], R).
% substitute_elem([], 2, [4, 9, 8, 10], R).
% substitute_elem([1, 5, 5, 3, 6, 5], 2, [4, 9, 8, 10], R).
% substitute_elem([1, 5, 5, 3, 6, 5], 1, [4, 9, 8, 10], R).
