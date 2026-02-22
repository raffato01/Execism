% 1. Il quadrato della somma: (1 + 2 + ... + N)^2
square_of_sum(N, Result) :-
    Sum is N * (N + 1) // 2,
    Result is Sum * Sum.

% 2. La somma dei quadrati: 1^2 + 2^2 + ... + N^2
sum_of_squares(N, Result) :-
    Result is N * (N + 1) * (2 * N + 1) // 6.

% 3. La differenza tra i due risultati
difference(N, Result) :-
    square_of_sum(N, SqrSum),
    sum_of_squares(N, SumSqr),
    Result is SqrSum - SumSqr.