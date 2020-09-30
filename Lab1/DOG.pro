domains
	name=string
predicates
	nondeterm dog(name)
	nondeterm parent(name, name)
clauses
	dog(X) :- parent(X,Y), dog(Y).
	dog("reks").
	parent("jek","reks").
goal
	dog(Who).


