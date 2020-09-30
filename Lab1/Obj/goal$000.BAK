/*вариант 4*/

domains
	name=string
predicates
	nondeterm dog(name)
	nondeterm parent(name, name) 
	nondeterm grandparent(name, name)
clauses
	/* TODO: как нормально группировать???*/
	dog(X) :- parent(Y, X), dog(Y). 
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
	
	grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
goal
	dog(DOG). /*TODO: узнать как сделать уникальным*/
	
	/*parent(PARENT, _). */
	
	/*grandparent(GRANDPARENT, _).*/
	/*parent(X, _Z), parent(_Z, _Y). TODO: узнать как скыть*/
	
	/*dog("bek").*/
	
	/*parent(PARENT_OF_BEK, "bek").*/
	
	/*parent("bek", CHILD_OF_BEK).*/	
