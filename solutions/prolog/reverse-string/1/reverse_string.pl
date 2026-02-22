string_reverse(S, Reversed) :-
    % 1. Trasforma la stringa in ingresso S in una lista di caratteri
    string_chars(S, Lista),
    
    % 2. Inverte la lista (usando il predicato integrato reverse/2)
    reverse(Lista, ListaInvertita),
    
    % 3. Trasforma la lista invertita nella stringa di uscita Reversed
    string_chars(Reversed, ListaInvertita).