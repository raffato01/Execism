% Define the 'chatty' fact
chatty(gustavo).
chatty(valeria).

% Define the 'likes' fact
likes(esteban, malena).
likes(malena, esteban).
likes(gustavo, valeria).

% Define the 'pairing' rule
pairing(Persona1, Persona2) :-
    likes(Persona1, Persona2),   % <--- Qui mancava la 's'
    likes(Persona2, Persona1).

pairing(Persona1, _) :- chatty(Persona1).
pairing(_, Persona2) :- chatty(Persona2).

% Define the 'seating' rule
seating(P1, P2, P3, P4, P5) :-
    pairing(P1, P2),
    pairing(P2, P3),
    pairing(P3, P4),
    pairing(P4, P5),
    pairing(P5, P1).