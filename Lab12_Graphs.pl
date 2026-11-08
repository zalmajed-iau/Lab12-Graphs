% Lab 12 - Graphs
% Task 1 - Find Paths Between Cities

% Facts
edge('Makkah', 'Madinah').
edge('Madinah', 'Makkah').
edge('Madinah', 'Taif').
edge('Madinah', 'Tabuk').
edge('Makkah', 'Riyadh').

edge('Tabuk', 'Taif').
edge('Taif', 'Tabuk').
edge('Taif', 'Dammam').

edge('Riyadh', 'Dammam').
edge('Dammam', 'Riyadh').

edge('Dammam', 'Qatif').
edge('Qatif', 'Dammam').
edge('Qatif', 'Madinah').

% Rules
travel(From, To, Path) :-
    path(From, To, [From], P),
    reverse(P, Path).

path(From, To, Visited, [To|Visited]) :-
    edge(From, To).

path(From, To, Visited, Path) :-
    edge(From, Next),
    Next \== To,
    \+ member(Next, Visited),
    path(Next, To, [Next|Visited], Path).
