% A student can pass an exam based on 4 conditions: studying for it, by luck, by cheating or by previous work experience. 
% Each condition has a probability associated with it. Each student (John, Bob, Mary and Pascal) has a particular set of courses. This comprises of the data
% A student is successfull if he/she passes all his/her courses. 
% There are a certain set of constraints associated.
% 1. A student can pass atmost either AI or Algo exam by luck. 
% 2. A student will definitely pass an algortithm exam if he has studied for it.
% 3. A student will not pass an the prolog exam if he is cheating in it. 
% 4. A student will find it difficult to pass an exam if he/she has a work experience of either 0 or 1 year.
% Based on the above conditions, we calculate the probability of actually passing all the courses taken by John, Bob, Mary or Pascal.

0.8::pass(Exam, studied). 
0.4::pass(Exam, luck). 
0.2::pass(Exam, cheating).
Pr::pass_prob(Exam,Work_Ex):- Pr is Work_Ex/4.
exam(E):- member(E, [prolog, operating_systems, algorithms, artificial_intelligence]).

student(john, [prolog, algorithms, operating_systems], 1).
student(bob, [artificial_intelligence, operating_systems], 2).
student(mary, [prolog], 3).
student(pascal, [artificial_intelligence, prolog], 4).

success(X):- student(X, Courses, Work_Ex), pass_every_course(Courses, Work_Ex).
pass_every_course([], _).
pass_every_course([H|T], Y):- pass_course(H, Y), pass_every_course(T, Y).
pass_course(E, _):-pass(E, _).
pass_course(E, Y):-pass_prob(E,Y).

ev1:-
\+ pass(algorithms,luck).
ev1:-
\+ pass(artificial_intelligence,luck).
evidence(ev1, true).
ev2:-
pass(algorithms,studied).
evidence(ev2,true).

ev3:-
pass(prolog,cheating).
evidence(ev3,false).

evidence(pass(prolog,1), false).
evidence(pass(operating_systems,1), false).
evidence(pass(algorithms,1), false).
evidence(pass(artificial_intelligence,1), false).

evidence(pass(prolog,0), false).
evidence(pass(operating_systems,0), false).
evidence(pass(algorithms,0), false).
evidence(pass(artificial_intelligence,0), false).

query(success(mary)).
query(success(john)).
query(success(bob)).
query(success(pascal)).

