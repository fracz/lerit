:- module(se2,[do]).

:- dynamic([asked/1, answers/2, facts/1]).

%places
go_to(banoli):- 
	(fact(fried_meal); 
	fact(common_dinner)),
	possible_answers(wczoraj_bylem_w, [zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]),
	possible_answers(przedwczoraj_bylem_w, [zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]).
	
go_to(zascianek):- 
	fact(beer_pub),
	possible_answers(wczoraj_bylem_w, [banoli, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]),
	possible_answers(przedwczoraj_bylem_w, [banoli, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]).
	
go_to(olimp):-
	fact(pizza),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]).
	
go_to(jazzrock):-
	(fact(party);
	fact(cold_drinks)),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]).
	
go_to(jubilat):-
	(fact(date);
	fact(business)),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, vega, turek_kebab, taco, best_zups, grycan, dominium]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, vega, turek_kebab, taco, best_zups, grycan, dominium]).
	
go_to(vega):-
	(fact(vegetarian);
	fact(health)),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, turek_kebab, taco, best_zups, grycan, dominium]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, turek_kebab, taco, best_zups, grycan, dominium]).

go_to(turek_kebab):-
	(fact(fast_meal);
	fact(hot_meal);
	fact(student)),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, taco, best_zups, grycan, dominium]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, taco, best_zups, grycan, dominium]).

go_to(taco):-
	(fact(foreign_meal);
	fact(hot_meal);
	fact(date);
	fact(business);
	fact(common_dinner)),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, best_zups, grycan, dominium]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, best_zups, grycan, dominium]).

go_to(best_zups):-
	fact(hot_meal),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, grycan, dominium]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, grycan, dominium]).

go_to(grycan):-
	(fact(cold_drinks);
	fact(date)),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, dominium]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, dominium]).
	
go_to(dominium):-
	(fact(pizza);
	fact(business)),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan]).

category_answers(cena, [drogo, przecietnie, tanio]) :- true.
category_answers(sam, [tak, nie]) :- true.
category_answers(dzien_tygodnia, [pon_czw, pt, sb, nd]) :- true.
category_answers(czas_spedzony, [duzo, przecietnie, malo]) :- true.
category_answers(temperatura, [cieplo, normalnie, zimno]) :- true.
category_answers(glod, [duzy, przecietny, maly]) :- true.
category_answers(kuchnia, [chinska, japonska, fastfood, polska]) :- true.
category_answers(z_kobieta, [tak, nie]) :- true.
category_answers(biznesowe, [tak, nie]) :- true.
category_answers(nowe_znajomosci, [tak, nie]) :- true.
category_answers(wegetarianin, [tak, nie]) :- true.
category_answers(kalorycznosc, [duzo, malo]) :- true.
category_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]) :- true.
category_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]) :- true.

fact(beer_pub):- answer(sam, nie), possible_answers(czas_spedzony, [duzo, przecietnie]), possible_answers(dzien_tygodnia, [pt, sb, nd]).
fact(fried_meal):-possible_answers(cena, [przecietnie, tanio]), answer(sam, nie), possible_answers(czas_spedzony, [duzo, przecietnie]).
fact(common_dinner):-possible_answers(cena, [przecietnie, tanio]), possible_answers(dzien_tygodnia, [pon_czw, pt]).
fact(fast_meal):-possible_answers(czas_spedzony, malo), possible_answers(nowe_znajomosci, nie), possible_answers(kuchnia, fastfood).
fact(date):-possible_answers(z_kobieta, tak), possible_answers(czas_spedzony, duzo), possible_answers(cena, drogo).
fact(business):-possible_answers(biznesowe, tak), possible_answers(dzien_tygodnia, [pon_czw, pt, sb]).
fact(party):-possible_answers(dzien_tygodnia, [pt, sb, nd]), possible_answers(sam, nie), possible_answers(nowe_znajomosci, tak), possible_answers(glod, maly).
fact(hot_meal):-possible_answers(temperatura, zimno), possible_answers(kalorycznosc, duzo).
fact(foreign_meal):-possible_answers(kuchnia, [chinska, japonska]).
fact(pizza):-possible_answers(kalorycznosc, duzo), possible_answers(glod, duzy), possible_answers(nowe_znajomosci, tak).
fact(health):-possible_answers(kalorycznosc, malo), possible_answers(glow, [przecietny, maly]).
fact(student):-possible_answers(cena, tanio), possible_answers(sam, tak), possible_answers(kalorycznosc, duzo).
fact(vegetarian):-possible_answers(wegetarianin, tak).
fact(cold_drinks):-possible_answers(temperatura, [cieplo, normalnie]).


possible_answers(Category, [Answer | Rest]):- answer(Category, Answer); possible_answers(Category, Rest).



print_category_answers(C) :- category_answers(C, X), write(X).

inner_print([H | T]) :- !, write(H), write(' | '), inner_print(T). 
inner_print([]) :- true. 


%answers - if not set in asked - ask other whise got aswer
answer(C, F):- (not(asked(C)),  ask(C, F)); answers(C, F).


ask_user_promt(C, Replay) :- !, write('odpowiedz: '), write(C), write(' ?'), print_category_answers(C), write('\n'), readln([Replay]).

check_member(C, Possible, Replay) :-  
		(not(member(Replay, Possible)), ask_again(C, Replay)); true.

ask_again(C, Replay) :- !, write('podana odpowiedz: "'), write(Replay), write('" nie jest prawidlowa\n'), ask_user(C, Replay).	

ask_user(C, Replay) :- 
	ask_user_promt(C, Replay),
	category_answers(C, Possible),
	check_member(C, Possible, Replay).
	

ask(C, F):- 
	ask_user(C, Replay),
	assertz(asked(C)),
	assertz(answers(C, Replay)),
	answers(C, F).

inner_clean :- retractall(asked(_)),
	retractall(answers(_, _)),
	retractall(facts(_)).
	 

clean :-
	inner_clean,
	write('\n\nNacisnij enter aby zakonczyc\n'),
	readln(_).

do :-
	go_to(X), !,
	write('Idz do: '), write(X), nl,
	clean.
	
do :-
	write('\nNie jestem w stanie odgadnac, '),
	write('gdzie chcesz isc na lunch.\n\n'),
	clean.

 