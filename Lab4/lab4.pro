DATABASE
	found(string)
	xpositive(string)
	xnegative(string)

PREDICATES
	ask(string)
	positive(string)
	run
	clear_facts
	remember(string,string)
	find_reason
	step1(string)
	step2(string,string)
	step3(string,string,string)
	step4(string,string,string,string)

CLAUSES
	run :- find_reason, found(X), write("������� ������� - ",X), nl, clear_facts,!.
	run :- nl,write("������� �� ������ ���������� ������� �������."), nl, clear_facts.
	
	find_reason :- step1(X), step2(X,Y), step3(X,Y,Z), step4(X,Y,Z,_), !.
	find_reason.
	
	positive(X) :- xpositive(X),!.
	positive(X) :- not(xnegative(X)), ask(X).
	
	ask(X) :- write(X), write("?"), nl, 
		  readln(Reply), remember(X,Reply).
	
	remember(X,"��") :- asserta(xpositive(X)).
	remember(X,"���") :- asserta(xnegative(X)), fail.
	
	clear_facts :- retractall(xpositive(_)), fail.
	clear_facts :- retractall(xnegative(_)), fail.         
	clear_facts :- retractall(found(_)), fail.
	clear_facts :- write("������� Enter ��� ������."), readln(_).          
	
	%-----------------------------------------------------------------------------------%
	
	step1("a") :- positive("��������� ��������"),!.
	step1("n").

	step2("a","b") :- positive("��������� ��������������� �����������"),!.
	step2("a","n").
	step2("n","c") :- positive("��������� ����������� ������"),!.
	step2("n","n").
	
	step3("a","b","d") :- positive("��������� ����������� ��������"),!.
	step3("a","b","n").
	step3("a","n","f") :- positive("�� ����� �����������"), asserta(found("������������� ����������")),!.
	step3("a","n","n").
	step3("n","c","d") :- positive("��������� ����������� ��������"), asserta(found("������������� ����������")),!.
	step3("n","c","n").
	step3("n","n","e") :- not(positive("��������� ���������")), asserta(found("������������� ����� �������")),!. 
	step3("n","n","n").
	
	step4("a","b","d","f") :- positive("�� ����� �����������"), asserta(found("������������� �������� �����")),!.
	step4("a","b","d","n") :- asserta(found("������������� ������")),!.
	step4("a","b","n","f") :- positive("�� ����� �����������"), asserta(found("��������� ������ �������� �������� �����")),!.
	step4("a","b","n","n") :- asserta(found("������������� �������������")),!.
	step4("a","n","n","c") :- positive("��������� ����������� ������"), asserta(found("��������� ������� ��������")),!.
	step4("a","n","n","n") :- asserta(found("������������� �����������")),!.
	step4("n","c","n","f") :- positive("�� ����� �����������"), asserta(found("������������� ���� ����������")),!.
	step4("n","c","n","n") :- asserta(found("������������� ��������")),!.
	step4("n","n","n","f") :- positive("�� ����� �����������"), asserta(found("������������� ����������� �����")),!.

GOAL
	run.
