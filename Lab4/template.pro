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
	run :- find_diagnosis, found(X), write("Ваш диагноз - ",X),nl,clear_facts,!.
	run:-nl,write("Система не может поставить диагноз."), nl, clear_facts.
	
	find_diagnosis :- test1(X), test2(X,Y), test3(X,Y,Z), test4(X,Y,Z,S), test5(X,Y,Z,S,_),!.
	find_diagnosis.
	
	positive(X,Y) :- xpositive(X,Y),!.
	positive(X,Y) :- not(xnegative(X,Y)), ask(X,Y).
	
	ask(X,Y) :- write(X), write(" "), write(Y), write("?"), nl, 
		    readln(Reply), remember(X,Y,Reply).
	
	remember(X,Y,"да") :- asserta(xpositive(X,Y)).
	remember(X,Y,"нет") :- asserta(xnegative(X,Y)), fail.
	
	clear_facts :- retractall(xpositive(_,_)), fail.
	clear_facts :- retractall(xnegative(_,_)), fail.         
	clear_facts :- retractall(found(_)), fail.
	clear_facts :- write("Нажмите Enter для выхода."), readln(_).          
	
	test1("a") :- it_is("Предположение1"),!.
	test1("n").

	test2("a","b") :- positive("Чувствуются", "боли в горле"),!.
	test2("a","n").
	test2("n","c") :- it_is("Предположение2"),!.
	test2("n","n").
	
	test3("a","b","d") :- positive("Имеется", "налет на миндалинах"), asserta(found("ангина")),!.

	test3("a","b","n").
	test3("a","n","g") :- positive("Чувствуется", "тошнота"), positive("Наблюдается", "плохой аппетит"),
			      asserta(found("Пищевая интоксикация")),!.

	test3("a","n","n").
	test3("n","c","e") :- positive("Имеется", "высокая температура"), 
			      positive("Происходит", "выделение мокроты при кашле"), 
			      asserta(found("Коклюш")),!.
	test3("n","c","n").
	test3("n","n","f"):- positive("Наблюдается","кашель"), positive("Наблюдается","затрудненное дыхание"),
			     not(positive("Имеется","налет на миндалинах")), 
			     asserta(found("Острый ларингит")),!.
	test3("n","n","n").

	test4("a","b","n","h") :- positive("Имеется", "сыпь на коже"), 
				  asserta(found("Скарлатина")),!.
	test4("a","n","n","i") :- positive("Чувствуется","жжение в носу"), 
				  asserta(found("острый насморк")),!.
	test4("a","n","n","n").
	test4("n","c","n","j") :- positive("Чувствуется","головная боль"), 
				  asserta(found("ОРЗ")),!.
	test4("n","n","n","k") :- positive("Чувствуются","боли в горле"), positive("Наблюдается","слюнотечение"),
				  not(positive("Имеется","высокая температура")), 
				  asserta(found("Инородное тело в гортани")),!.
	test4("n","n","n","n").

	test5("a","n","n","n","m") :- positive("Чувствуются","боли в ухе"), 
				      positive("Наблюдаются","симптомы интоксикации"),
				      asserta(found("Отит")),!.
	test5("n","n","n","n","l") :- positive("Чувствуется","тошнота"),
	  			      positive("Чувствуется", "понижение слуха при попадании в ухо воды"),
				      positive("Чувствуется","головная боль"),	
				      asserta(found("Серная пробка в ухе")),!.

	it_is("Предположение1") :- positive("Имеется","высокая температура"), positive("Чувствуется","головная боль").
	it_is("Предположение2") :- positive("Наблюдается","насморк"), positive("Наблюдается","кашель").
	
GOAL
	run.
