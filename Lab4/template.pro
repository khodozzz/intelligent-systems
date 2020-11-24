DATABASE
	found(string)
	xpositive(string,string)
	xnegative(string,string)

PREDICATES
	ask(string,string)
	it_is(string)
	positive(string,string)
	run
	clear_facts
	remember(string,string,string)
	find_diagnosis
	test1(string)
	test2(string,string)
	test3(string,string,string)

	nondeterm test4(string,string,string,string)
	test5(string,string,string,string,string)

CLAUSES
	run :- find_diagnosis, found(X), write("��� ������� - ",X),nl,clear_facts,!.
	run:-nl,write("������� �� ����� ��������� �������."), nl, clear_facts.
	
	find_diagnosis :- test1(X), test2(X,Y), test3(X,Y,Z), test4(X,Y,Z,S), test5(X,Y,Z,S,_),!.
	find_diagnosis.
	
	positive(X,Y) :- xpositive(X,Y),!.
	positive(X,Y) :- not(xnegative(X,Y)), ask(X,Y).
	
	ask(X,Y) :- write(X), write(" "), write(Y), write("?"), nl, 
		    readln(Reply), remember(X,Y,Reply).
	
	remember(X,Y,"��") :- asserta(xpositive(X,Y)).
	remember(X,Y,"���") :- asserta(xnegative(X,Y)), fail.
	
	clear_facts :- retractall(xpositive(_,_)), fail.
	clear_facts :- retractall(xnegative(_,_)), fail.         
	clear_facts :- retractall(found(_)), fail.
	clear_facts :- write("������� Enter ��� ������."), readln(_).          
	
	test1("a") :- it_is("�������������1"),!.
	test1("n").

	test2("a","b") :- positive("�����������", "���� � �����"),!.
	test2("a","n").
	test2("n","c") :- it_is("�������������2"),!.
	test2("n","n").
	
	test3("a","b","d") :- positive("�������", "����� �� ����������"), asserta(found("������")),!.

	test3("a","b","n").
	test3("a","n","g") :- positive("�����������", "�������"), positive("�����������", "������ �������"),
			      asserta(found("������� ������������")),!.

	test3("a","n","n").
	test3("n","c","e") :- positive("�������", "������� �����������"), 
			      positive("����������", "��������� ������� ��� �����"), 
			      asserta(found("������")),!.
	test3("n","c","n").
	test3("n","n","f"):- positive("�����������","������"), positive("�����������","������������ �������"),
			     not(positive("�������","����� �� ����������")), 
			     asserta(found("������ ��������")),!.
	test3("n","n","n").

	test4("a","b","n","h") :- positive("�������", "���� �� ����"), 
				  asserta(found("����������")),!.
	test4("a","n","n","i") :- positive("�����������","������ � ����"), 
				  asserta(found("������ �������")),!.
	test4("a","n","n","n").
	test4("n","c","n","j") :- positive("�����������","�������� ����"), 
				  asserta(found("���")),!.
	test4("n","n","n","k") :- positive("�����������","���� � �����"), positive("�����������","������������"),
				  not(positive("�������","������� �����������")), 
				  asserta(found("��������� ���� � �������")),!.
	test4("n","n","n","n").

	test5("a","n","n","n","m") :- positive("�����������","���� � ���"), 
				      positive("�����������","�������� ������������"),
				      asserta(found("����")),!.
	test5("n","n","n","n","l") :- positive("�����������","�������"),
	  			      positive("�����������", "��������� ����� ��� ��������� � ��� ����"),
				      positive("�����������","�������� ����"),	
				      asserta(found("������ ������ � ���")),!.

	it_is("�������������1") :- positive("�������","������� �����������"), positive("�����������","�������� ����").
	it_is("�������������2") :- positive("�����������","�������"), positive("�����������","������").
	
GOAL
	run.
