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
	run :- find_reason, found(X), write("Причина поломки - ",X), nl, clear_facts,!.
	run :- nl,write("Система не смогла определить причину поломки."), nl, clear_facts.
	
	find_reason :- step1(X), step2(X,Y), step3(X,Y,Z), step4(X,Y,Z,_), !.
	find_reason.
	
	positive(X) :- xpositive(X),!.
	positive(X) :- not(xnegative(X)), ask(X).
	
	ask(X) :- write(X), write("?"), nl, 
		  readln(Reply), remember(X,Reply).
	
	remember(X,"да") :- asserta(xpositive(X)).
	remember(X,"нет") :- asserta(xnegative(X)), fail.
	
	clear_facts :- retractall(xpositive(_)), fail.
	clear_facts :- retractall(xnegative(_)), fail.         
	clear_facts :- retractall(found(_)), fail.
	clear_facts :- write("Нажмите Enter для выхода."), readln(_).          
	
	%-----------------------------------------------------------------------------------%
	
	step1("a") :- positive("Программы зависают"),!.
	step1("n").

	step2("a","b") :- positive("Компьютер самопроизвольно выключается"),!.
	step2("a","n").
	step2("n","c") :- positive("Пропадает изображение экрана"),!.
	step2("n","n").
	
	step3("a","b","d") :- positive("Программы завершаются аварийно"),!.
	step3("a","b","n").
	step3("a","n","f") :- positive("ОС долго загружается"), asserta(found("Неисправность процессора")),!.
	step3("a","n","n").
	step3("n","c","d") :- positive("Программы завершаются аварийно"), asserta(found("Неисправность видеокарты")),!.
	step3("n","c","n").
	step3("n","n","e") :- not(positive("Компьютер вклюается")), asserta(found("Неисправность блока питания")),!. 
	step3("n","n","n").
	
	step4("a","b","d","f") :- positive("ОС долго загружается"), asserta(found("Неисправность жесткого диска")),!.
	step4("a","b","d","n") :- asserta(found("Неисправность памяти")),!.
	step4("a","b","n","f") :- positive("ОС долго загружается"), asserta(found("Поврежден сектор загрузки жесткого диска")),!.
	step4("a","b","n","n") :- asserta(found("Неисправность конденсаторов")),!.
	step4("a","n","n","c") :- positive("Пропадает изображение экрана"), asserta(found("Компьютер заражен вирусами")),!.
	step4("a","n","n","n") :- asserta(found("Неисправность вентилятора")),!.
	step4("n","c","n","f") :- positive("ОС долго загружается"), asserta(found("Неисправность ядра процессора")),!.
	step4("n","c","n","n") :- asserta(found("Неисправность монитора")),!.
	step4("n","n","n","f") :- positive("ОС долго загружается"), asserta(found("Неисправность материнской платы")),!.

GOAL
	run.
