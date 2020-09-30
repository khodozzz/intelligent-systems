domains
	name=symbol
predicates
	man(name)
	woman(name)
	
	parent(name, name)
	mother(name, name)
	father(name, name)
	
	married(name, name)
	husband(name, name)
	wife(name, name)
	
	sibship(name, name)
	sister(name, name)
	brother(name, name)
	
	grandparent(name, name)
	grandfather(name, name)
	grandmother(name, name)
clauses
	mother(X, Y) :- parent(X, Y), woman(X).
	father(X, Y) :- parent(X, Y), man(X).
	
	husband(X, Y) :- married(X, Y), man(X).
	wife(X, Y) :- married(X, Y), woman(X).
	
	sibship(X, Y) :- parent(Z, X), parent(Z, Y).
	sister(X, Y) :- sibship(X, Y), woman(X).
	brother(X, Y) :- sibship(X, Y), man(X).
	
	grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
	grandfather(X, Y) :- grandparent(X, Y), man(X).
	grandmother(X, Y) :- grandparent(X, Y), woman(X).


	man("man").
	man("child").
	woman("woman").
	married("man", "woman").
	married("woman", "man").
	parent("man", "child").

goal
	father(X, Y).
	

