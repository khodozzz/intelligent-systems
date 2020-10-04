domains
	name=symbol


database - db
	man(name)
	woman(name)
	married(name, name)
	parent(name, name)
	
	
clauses 
	man("A").
	man("B").
	man("C").
	man("b").
	
	woman("a").
	woman("D").
	woman("F").
	
	married("A", "a").
	married("a", "A").
	married("b", "B").
	married("B", "b").
	
	parent("A", "B").
	parent("B", "C").
	parent("B", "D").
	parent("D", "F").
	
	
predicates
	nondeterm mother(name, name) 
	nondeterm father(name, name)
	
	nondeterm husband(name, name)
	nondeterm wife(name, name)
	
	nondeterm sibling(name, name)
	nondeterm sister(name, name)
	nondeterm brother(name, name)
	
	nondeterm grandparent(name, name)
	nondeterm grandfather(name, name)
	nondeterm grandmother(name, name)
	
	nondeterm uncle(name, name)
	nondeterm aunt(name, name)


clauses
	father(FAT, CH) :- parent(FAT, CH), man(FAT).			%parent and man
	mother(MOT, CH) :- parent(MOT, CH), woman(MOT). 				
	
	husband(HUS, SP) :- married(HUS, SP), man(HUS). 				
	wife(WIF, SP) :- married(WIF, SP), woman(WIF).
	
	sibling(SIB1, SIB2) :- parent(PAR, SIB1), parent(PAR, SIB2), 	%have same parent and
			       SIB1 <> SIB2.				%not sibling for self
	sister(SIS, SIB) :- sibling(SIS, SIB), woman(SIS).
	brother(BRO, SIB) :- sibling(BRO, SIB), man(BRO).
	
	grandparent(GP, CH) :- parent(GP, PAR), parent(PAR, CH).	%parent of parent 
	grandfather(GF, CH) :- grandparent(GF, CH), man(GF).
	grandmother(GM, CH) :- grandparent(GM, CH), woman(GM).
	
	uncle(UNC, NEP) :- parent(PAR, NEP), brother(UNC, PAR).		%brother of parent 
	aunt(AUN, NEP) :- parent(PAR, NEP), sister(AUN, PAR).


goal
	%father(FATHER, CHILD).
	%married(SPOUSE1, SPOUSE2).
	%husband(HUSBAND, _).
	%sibling(SIBSHIP1, SIBSHIP2).
	%grandfather(GRANDFATHER, GRANDCHILD).
	uncle(UNCLE, NEPHEW).
	

