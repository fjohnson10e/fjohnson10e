%A prefix is empty or not.

%An empty list is a prefix of anything.
prefix([], _).

%A non-empty list is a prefix of the second argument if and only if
%its head coincides with the head of the second argument
%and its tail is a prefix of the tail of the second argument.
prefix([X|Xs], [X|Ys]) :- prefix(Xs, Ys).

%A postfix starts at the head (including it) of the second argument or not.

%A postfix starts at the head of the second argument if and only if
%it's equal to the second argument.
postfix(Xs, Xs).

%A postfix doesn't start at the head of the second argument if and only if
%it's a postfix of the tail of the second argument.
postfix(Xs, [_|Ys]) :- postfix(Xs, Ys).
