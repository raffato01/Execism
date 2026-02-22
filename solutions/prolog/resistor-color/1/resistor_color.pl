% The list of colors as strings to match the test cases
colors([
    "black",
    "brown",
    "red",
    "orange",
    "yellow",
    "green",
    "blue",
    "violet",
    "grey",
    "white"
]).

% Look up the numerical value (Code) for a specific Color string
color_code(Color, Code) :-
    colors(List),
    nth0(Code, List, Color).