domains
	name=symbol

database 
	man(name)
	woman(name)
	married(name, name)
	parent(name, name)
	
clauses 
	man("man1").
	man("child of man1").
	man("grandson of man1").
	woman("wife of man1").
	woman("granddaughter of man1").
	married("man1", "wife of man1").
	married("wife of man1", "man1").
	parent("man1", "child of man1").
	parent("child of man1", "grandson of man1").
	parent("child of man1", "granddaughter of man1").
	
predicates
	nondeterm mother(name, name)
	nondeterm father(name, name)
	
	nondeterm husband(name, name)
	nondeterm wife(name, name)
	
	nondeterm sibship(name, name)
	nondeterm sister(name, name)
	nondeterm brother(name, name)
	
	nondeterm grandparent(name, name)
	nondeterm grandfather(name, name)
	nondeterm grandmother(name, name)

clauses
	mother(X, Y) :- parent(X, Y), woman(X).
	father(X, Y) :- parent(X, Y), man(X).
	
	husband(X, Y) :- married(X, Y), man(X).
	wife(X, Y) :- married(X, Y), woman(X).
	
	sibship(X, Y) :- parent(Z, X), parent(Z, Y), X <> Y.
	sister(X, Y) :- sibship(X, Y), woman(X).
	brother(X, Y) :- sibship(X, Y), man(X).
	
	grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
	grandfather(X, Y) :- grandparent(X, Y), man(X).
	grandmother(X, Y) :- grandparent(X, Y), woman(X).

goal
	sibship(X, Y).
	

