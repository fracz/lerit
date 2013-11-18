:- module(se2,[do]).

:- dynamic([asked/1, answers/2, facts/1]).

%places
go_to(banoli):- 
	fact(fried_meal); 
	fact(common_dinner).
	
go_to(zacianek):- 
	fact(beer_pub).

category_answers(cena, [drogo, przecietne, tanio]) :- true.
category_answers(sam, [tak, nie]) :- true.
category_answers(dzien_tygodnia, [pon_czw, pt, sb, nd]) :- true.
category_answers(czas_spedzony, [duzo, przecietnie, malo]) :- true.

fact(beer_pub):- answer(sam, nie), possible_answers(czas_spedzony, [duzo, przecietnie]), possible_answers(dzien_tygodnia, [pt, sb, nd]).
fact(fried_meal):-possible_answers(cena, [przecietnie, tanio]), answer(sam, nie), possible_answers(czas_spedzony, [duzo, przecietnie]).
fact(common_dinner):-possible_answers(cena, [przecietnie, tanio]), possible_answers(dzien_tygodnia, [pon_czw, pt]).




possible_answers(Category, [Anser | Rest]):- answer(Category, Anser); possible_answers(Category, Rest).



print_category_answers(C) :- category_answers(C, X), write(X).

inner_print([H | T]) :- !, write(H), write(' | '), inner_print(T). 
inner_print([]) :- true. 


%answers - if not set in asked - ask other whise got aswer
answer(C, F):- (not(asked(C)),  ask(C, F)); answers(C, F).


ask_user_promt(C, Replay) :- !, write('odpowiedz: '), write(C), write(' ?'), print_category_answers(C), write('\n'), readln([Replay]).

check_member(C, Possible, Replay) :-  
		(not(member(Replay, Possible)), ask_again(C, Replay)); true.

ask_again(C, Replay) :- !, write('podana odpowiedź: "'), write(Replay), write('" nie jest prawidłowa\n'), ask_user(C, Replay).	

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

 