domains
integer_tree = tree(integer, integer_tree, integer_tree); empty()

predicates
nondeterm get_depth(integer_tree, integer).

clauses
get_depth(empty, 0).
get_depth(tree(_, Left, Right), Depth):-get_depth(Left, _lDepth), get_depth(Right, _rDepth), _lDepth > _rDepth, Depth = _lDepth + 1.
get_depth(tree(_, Left, Right), Depth):-get_depth(Left, _lDepth), get_depth(Right, _rDepth), _lDepth <= _rDepth, Depth = _rDepth + 1.

goal
get_depth(tree(8, tree(8, empty, empty), tree(8, empty, tree(8, empty, empty))), Result).

