domains
integer_tree = tree(integer, integer_tree, integer_tree); empty()

predicates
nondeterm get_zero_count(integer_tree, integer).

clauses
get_zero_count(empty, 0).
get_zero_count(tree(Root, Left, Right), Count):-get_zero_count(Left, _lCount), get_zero_count(Right, _rCount), Root = 0, Count = _lCount + _rCount + 1.
get_zero_count(tree(Root, Left, Right), Count):-get_zero_count(Left, _lCount), get_zero_count(Right, _rCount), Root <> 0, Count = _lCount + _rCount.

goal
get_zero_count(tree(0,tree(0,tree(0, empty, empty),empty),tree(0,empty, empty)), Result).