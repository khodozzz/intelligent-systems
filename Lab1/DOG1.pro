/*variant 4*/

domains
	name=string
	
predicates
	nondeterm dog(name)
	nondeterm parent(name, name) 
	nondeterm grandparent(name, name)
	
clauses
	dog(CH) :- parent(P, CH), dog(P). %Parent, CHild

	dog("reks").
	dog("fat").
	

	parent("reks", "boss").
	parent("reks", "jim").
	
	parent("boss", "jim").
	parent("boss", "jek").

	parent("jek", "sally").
	
	parent("sally", "bek").
	
	parent("fat", "jim").
	parent("fat", "bek").
	
	grandparent(GP, CH) :- parent(GP, P), parent(P, CH). %GRandparent, Parent, CHild
goal
	dog(DOG). 			%TODO: how to get unique vals 
	
	%parent(PARENT, _). 
	
	%parent(X, Z), parent(Z, Y). 	%TODO: how to hide Z, Y
	%grandparent(GRANDPARENT, _).
	
	%dog("bek").
	
	%parent(PARENT_OF_BEK, "bek").
	%parent("bek", CHILD_OF_BEK).
