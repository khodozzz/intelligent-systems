domains
integer_list = integer*

predicates
nondeterm subset(integer_list,integer_list) 
nondeterm del(integer, integer_list, integer_list)
nondeterm member(integer, integer_list)

clauses
del(X,[X|Tail], Tail).
del(X,[Y|Tail],[Y|Tail1]):- del(X,Tail,Tail1).

member(X,L):-del(X,L,_).

subset([], _).
subset([Head|Tail], List):- member(Head, List), del(Head, List, _nList), 
			    subset(Tail, _nList).

goal
subset([1,2,3,3], [5,1,2,2,3]).