/*variant 4*/

domains
	name=string

	
predicates
	nondeterm dog(name)
	nondeterm parent(name, name) 
	nondeterm grandparent(name, name)

	
clauses
	grandparent(GP, CH) :- parent(GP, P), parent(P, CH).	%parent of parent 
	
	dog(CH) :- parent(P, CH), dog(P). 			%dog if parent is dog
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
	
	
goal
	%dog(DOG).	
	%parent(PARENT, _). 
	grandparent(GRANDPARENT, _).
	%dog("bek").
	%parent(PARENT_OF_BEK, "bek").
	%parent("bek", CHILD_OF_BEK).
