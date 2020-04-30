/* Roll-number : 3946 C-number : C22017881863 */
/* an expert system  which tells you what to cook as a SNACKS FOR QUARANTINE */

go:- suggest(Food),
write('I think you should cook: '),
write(Food),
nl,
undo.


suggest(pavbhaji) :- pavbhaji, !.
suggest(panipoori) :- panipoori, !.
suggest(fries) :- fries, !.
suggest(chickennuggets) :- chickennuggets, !.
suggest(omlette) :- omlette, !.
suggest(cripsykandabhajji) :- cripsykandabhajji, !.
suggest(pattice) :- pattice, !.
suggest(noodles) :- noodles, !.
suggest(frenchtoast) :- frenchtoast, !.
suggest(go out for snacks).


pavbhaji :-
verify(bread),
verify(butter),
verify(vegetables),
verify(timetocook),
verify(veg).

panipoori :-
verify(poori),
verify(timetocook),
verify(pudina),
verify(masala).

fries :-
verify(oil),
verify(potatoes),
verify(sauce),
verify(veg),
verify(notime).

chickennuggets :-
verify(nonveg),
verify(timetocook),
verify(chicken),
verify(oil),
verify(masala).

omlette :-
verify(nonveg),
verify(egg),
verify(oil),
verify(bread),
verify(notime).

cripsykandabhajji :-
verify(notime),
verify(oil),
verify(onion),
verify(flour),
verify(veg).

pattice :-
verify(veg),
verify(potatoes),
verify(flour),
verify(oil),
verify(timetocook).

noodles :-
verify(noodles),
verify(oil),
verify(notime),
verify(masala),
verify(veg).

frenchtoast :-
verify(egg),
verify(bread),
verify(notime),
verify(nonveg),
verify(oil).


ask(Question) :-
write("Do you have any of the following : "),
write(Question),
write('?'),
nl,
read(Response),

((Response==yes;Response==y)
->
assert(yes(Question));
assert(no(Question)),fail).
:-dynamic yes/1,no/1.

verify(S) :-
(yes(S)
	->
	true;
	(no(S)
		->
		fail ;
		ask(S))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.


/* OUTPUT :
?- go.
Do you have any of the following : bread?
|: no.
Do you have any of the following : poori?
|: no.
Do you have any of the following : oil?
|: yes.
Do you have any of the following : potatoes?
|: yes.
Do you have any of the following : sauce?
|: yes.
Do you have any of the following : veg?
|: yes.
Do you have any of the following : notime?
|: yes.
I think you should cook: fries
true.

*/