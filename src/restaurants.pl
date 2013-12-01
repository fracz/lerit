:- module(se2,[find, fix]).

:- dynamic([asked/1, answers/2, facts/1]).

%places 15
go_to(banoli):- 
	(fact(fried_meal); 
	fact(common_dinner)),
	fact(dzien),
	fact(centrum),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]))).
	
go_to(zascianek):- 
	fact(beer_pub),
	fact(dzien),
	fact(centrum),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]))).
	
go_to(olimp):-
	fact(pizza),
	fact(dzien),
	fact(centrum),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]))).
	
go_to(jazzrock):-
	(fact(party);
	fact(cold_drinks)),
	fact(centrum),
	possible_answers(pora_dnia, [wieczor, noc]),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]))).
	
go_to(jubilat):-
	(fact(date);
	fact(business)),
	fact(centrum),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]))).
	
go_to(vega):-
	(fact(vegetarian);
	fact(health)),
	fact(dzien),
	fact(centrum),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]))).

go_to(turek_kebab):-
	(fact(fast_meal);
	fact(hot_meal);
	fact(student)),
	(fact(centrum);fact(poza_centrum)),
	possible_answers(pora_dnia, [poludnie, wieczor, noc]),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]))).

go_to(taco):-
	(fact(foreign_meal);
	fact(hot_meal);
	fact(date);
	fact(business);
	fact(common_dinner)),
	fact(dzien),
	fact(centrum),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]))).

go_to(best_zups):-
	fact(hot_meal),
	fact(dzien),
	fact(centrum),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, grycan, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]))).

go_to(grycan):-
	(fact(cold_drinks);
	fact(date)),
	fact(dzien),
	(fact(centrum);fact(poza_centrum)),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, dominium, bar_mleczny, lemonday, starbucks, mcdonalds]))).
	
go_to(dominium):-
	(fact(pizza);
	fact(business)),
	fact(dzien),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, bar_mleczny, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, bar_mleczny, lemonday, starbucks, mcdonalds]))).

go_to(bar_mleczny):-
	(fact(national_meal);
	fact(student);
	fact(fast_meal)),
	fact(dzien),
	fact(poza_centrum),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, lemonday, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, lemonday, starbucks, mcdonalds]))).

go_to(lemonday):-
	(fact(business);
	fact(student)),
	fact(dzien),
	fact(centrum),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, starbucks, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, starbucks, mcdonalds]))).

go_to(starbucks):-
	fact(poza_centrum),
	possible_answers(temperatura, [zimno, przecietnie]),
	possible_answers(glod, maly),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, mcdonalds]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, mcdonalds]))).

go_to(mcdonalds):-
	(fact(fast_meal);
	fact(hot_meal);
	fact(student);
	fact(cold_drinks);
	fact(fried_meal)),
	(possible_answers(czy_lubie_zmiany, [nie]);(possible_answers(czy_lubie_zmiany, [tak]),
	possible_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks]),
	possible_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium, bar_mleczny, lemonday, starbucks]))).

% 20
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
category_answers(muzulmanin, [tak, nie]) :- true.
category_answers(kalorycznosc, [duzo, malo]) :- true.
category_answers(wczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]) :- true.
category_answers(przedwczoraj_bylem_w, [banoli, zascianek, olimp, jazzrock, jubilat, vega, turek_kebab, taco, best_zups, grycan, dominium]) :- true.
category_answers(pora_roku, [wiosna, lato, jesien, zima]) :- true.
category_answers(pora_dnia, [rano, poludnie, wieczor, noc]) :- true.
category_answers(daleko_do_centrum, [tak, nie]) :- true.
category_answers(srodek_transportu, [piechota, mpk, samochod, rower]) :- true.
category_answers(czy_lubie_zmiany, [tak, nie]) :- true.

% 18
fact(beer_pub):- answer(sam, nie), possible_answers(czas_spedzony, [duzo, przecietnie]), possible_answers(dzien_tygodnia, [pt, sb, nd]).
fact(fried_meal):-possible_answers(cena, [przecietnie, tanio]), answer(sam, nie), possible_answers(czas_spedzony, [duzo, przecietnie]).
fact(common_dinner):-possible_answers(cena, [przecietnie, tanio]), possible_answers(dzien_tygodnia, [pon_czw, pt]).
fact(fast_meal):-possible_answers(czas_spedzony, malo), possible_answers(nowe_znajomosci, nie), possible_answers(kuchnia, fastfood).
fact(date):-(possible_answers(z_kobieta, tak);possible_answers(biznesowe, nie)), possible_answers(czas_spedzony, duzo), possible_answers(cena, drogo).
fact(business):-(possible_answers(biznesowe, tak);possible_answers(z_kobieta, nie)), possible_answers(dzien_tygodnia, [pon_czw, pt, sb]).
fact(party):-possible_answers(dzien_tygodnia, [pt, sb, nd]), possible_answers(sam, nie), possible_answers(nowe_znajomosci, tak), possible_answers(glod, maly).
fact(hot_meal):-(possible_answers(temperatura, [zimno]); possible_answers(pora_roku, [jesien, zima])), possible_answers(kalorycznosc, duzo).
fact(foreign_meal):-possible_answers(kuchnia, [chinska, japonska]).
fact(national_meal):-possible_answers(kuchnia, [polska]).
fact(pizza):-possible_answers(kalorycznosc, duzo), possible_answers(glod, duzy), possible_answers(nowe_znajomosci, tak), possible_answers(muzulmanin, nie).
fact(health):-possible_answers(kalorycznosc, malo), possible_answers(glow, [przecietny, maly]).
fact(student):-possible_answers(cena, tanio), possible_answers(sam, tak), possible_answers(kalorycznosc, duzo).
fact(vegetarian):-possible_answers(wegetarianin, tak).
fact(cold_drinks):-possible_answers(temperatura, [cieplo, normalnie]);possible_answers(pora_roku, [lato]).
fact(dzien):-possible_answers(pora_dnia, [rano, poludnie, wieczor]).
fact(centrum):-(possible_answers(daleko_do_centrum, [nie]);possible_answers(srodek_transportu, [samochod, mpk])).
fact(poza_centrum):-possible_answers(srodek_transportu, [samochod, mpk]).

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

find :- inner_clean,
	do.

do :-
	go_to(X), !,
	write('Idz do: '), write(X), nl.
		
do :-
	write('\nNie jestem w stanie odgadnac, '),
	write('gdzie chcesz isc na lunch.\n\n').
	
fix :-
	findall(A, asked(A), List), 
 	write('\n Wybierz odpwiedz ktora chcesz zmienic: ['),
 	inner_print(List),
 	write('] \n'),
 	readln([Question]),
 	removeQuestion(Question),
 	do.	
 
 removeQuestion(Question) :- 
 	retract(asked(Question)),
 	retract(answers(Question, _)),
 	retractall(facts(_)).
 	
