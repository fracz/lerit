:- module(se2,[do]).

:- dynamic([asked/1, answers/2, facts/1]).

%places
go_to(banoli):- fact(fried_meal); fact(common_dinner).

%facts
%is(X):- facts(X); is_fact(X)

%is_fact(fried_meal): 




fact(fried_meal):- possible_ansers(cena, [przeciętnie, tanio]), answer(sam, nie), possible_ansers(czas_spedzony, [duzo, przecietnie]).
fact(common_dinner):- possible_ansers(cena, [przeciętnie, tanio]), possible_ansers(dzien_tygodnia, [pon_czw, pt]).


possible_ansers(Category, [Anser | Rest]):- answer(Category, Anser); possible_ansers(Category, Rest).
possible_ansers(Category, [Anser | Rest]):- answer(Category, Anser); possible_ansers(Category, Rest).


%answers - if not set in asked - ask other whise got aswer
answer(C, F):- (not(asked(C)),  ask(C, F)); answers(C, F).

ask(C, F):- !, write('odpowiedz: '), write(C), write(' ? (t/n)\n'),
	readln([Replay]),
	assertz(asked(C)),
	assertz(answers(C, Replay)).

clean :-
	write('\n\nNacisnij enter aby zakonczyc\n'),
	retractall(asked(_)),
	retractall(answers(_, _)),
	retractall(facts(_)),
	readln(_).

do :-
	go_to(X), !,
	write('Idź do: '), write(X), nl,
	clean.

do :-
	write('\nNie jestem w stanie odgadnac, '),
	write('gdzie chcesz iść na lunch.\n\n'),
	clean.

 