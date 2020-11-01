domains
integer_tree = tree(integer, integer_tree, integer_tree); empty()

predicates
nondeterm get_size(integer_tree, integer).
nondeterm get_sum(integer_tree, integer).
nondeterm get_average(integer_tree, real).

clauses
get_size(empty, 0).
get_size(tree(_, Left, Right), Size):-get_size(Left, _lSize), get_size(Right, _rSize), Left = empty(), Right = empty(), Size = _lSize + _rSize + 1.
get_size(tree(_, Left, Right), Size):-get_size(Left, _lSize), get_size(Right, _rSize), Left <> empty(), Right <> empty(), Size = _lSize + _rSize.

get_sum(empty, 0).
get_sum(tree(Root, Left, Right), Sum):- get_sum(Left, _lSum), get_sum(Right, _rSum), Left = empty, Right = empty, Sum = _lSum + _rSum + Root.
get_sum(tree(Root, Left, Right), Sum):- get_sum(Left, _lSum), get_sum(Right, _rSum), Left <> empty, Right <> empty, Sum = _lSum + _rSum.

get_average(Tree, Average):-get_size(Tree, Size), get_sum(Tree, Sum), Average = Sum / Size.

goal
get_average(tree(6,
		 tree(7,
		      tree(8, empty, empty),
		      empty),
		 tree(3,empty, empty)), Result).