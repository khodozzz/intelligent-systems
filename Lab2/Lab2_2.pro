domains
integer_list = integer*

predicates
nondeterm element_counting(integer_list, integer, integer, integer)
nondeterm compare(integer, integer, integer)

clauses
compare(Element, Min, Max):- Element > Min, Element < Max.

element_counting([], _, _, 0).
element_counting([Head|Tail], Min, Max, Result):- compare(Head, Min, Max), 
						  element_counting(Tail, Min, Max, _nResult), 
						  Result = _nResult + 1.
element_counting([Head|Tail], Min, Max, Result):- not(compare(Head, Min, Max)), 
						  element_counting(Tail, Min, Max, _nResult), 
						  Result = _nResult.

goal
element_counting([-3, 2, 5, 16, 14], -5, 16, Result).