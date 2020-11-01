domains
integer_list = integer*

predicates
nondeterm conc(integer_list, integer_list, integer_list)
nondeterm length(integer_list, integer)
nondeterm right_shift(integer_list, integer, integer_list)

clauses
length([], 0).
length([_|T],L):- length(T,_nL), L = _nL + 1.

conc([],L,L).
conc([H|T1],L2,[H|T3]):- conc(T1,L2,T3).

right_shift(List, Step, Result):- conc(Left, Right, List), conc(Right, Left, Result), length(Right, Step).

goal
right_shift([1,2,3,4,5], Step, Result).
