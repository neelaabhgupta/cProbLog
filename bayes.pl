person(john). person(mary). person(bob).
0.1::burglary. 0.2::earthquake. 0.5::fire.
0.7::hears_alarm(X) :- person(X).
alarm:- burglary. 
alarm:- earthquake.
alarm:- fire.
calls(X):- alarm, hears_alarm(X).
ev1:-
\+ calls(mary).
ev1:-
\+ calls(john).
ev1:-
\+ calls(bob).
evidence(ev1, true).

query(burglary). query(earthquake). query(fire).