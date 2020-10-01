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
	man("husband of child of man1").
	woman("wife of man1").
	woman("granddaughter of man1").
	married("man1", "wife of man1").
	married("wife of man1", "man1").
	married("husband of child of man1", "child of man1").
	married("child of man1", "husband of child of man1").
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
	mother(M, CH) :- parent(M, CH), woman(M). 			
	father(F, CH) :- parent(F, CH), man(F).
	
	husband(H, W) :- married(H, W), man(H). 			
	wife(W, H) :- married(W, H), woman(W).
	
	sibship(SIB1, SIB2) :- parent(P, SIB1), parent(P, SIB2), 	%have same parent
			   SIB1 <> SIB2.				%not sibship for himself
	sister(SIS, SIB) :- sibship(SIS, SIB), woman(SIS).
	brother(BRO, SIB) :- sibship(BRO, SIB), man(BRO).
	
	grandparent(GP, CH) :- parent(GP, P), parent(P, CH).		%GP is parent of parent of CH
	grandfather(GF, CH) :- grandparent(GF, CH), man(GF).
	grandmother(GM, CH) :- grandparent(GM, CH), woman(GM).

goal
	%father(FATHER, CHILD).
	
	%married(SPOUSE1, SPOUSE2).
	
	%husband(HUSBAND, _).
	
	%sibship(SIBSHIP1, SIBSHIP2).
	
	grandfather(GRANDFATHER, GRANDCHILD).
	

