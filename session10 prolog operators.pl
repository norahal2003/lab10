%% ---------- TASK 1: Area and perimeter ----------

:- discontiguous area/2, perimeter/2.

area(square(S), A) :- A is S * S.
perimeter(square(S), P) :- P is 4 * S.

area(rectangle(L, W), A) :- A is L * W.
perimeter(rectangle(L, W), P) :- P is 2 * (L + W).

area(triangle(B, H, _, _, _), A) :- A is 0.5 * B * H.
perimeter(triangle(_, _, S1, S2, S3), P) :- P is S1 + S2 + S3.

shape_info(Shape) :- area(Shape, A), perimeter(Shape, P), format("~w~n  Area      = ~w~n  Perimeter = ~w~n", [Shape, A, P]).

%% ---------- TASK 2: Login (3 attempts in total) ----------

user(ahmed, pass123).
user(sara, abc456).
user(khalid, secret789).
user(noura, qwerty).

max_attempts(3).

login :- login_attempt(1).

ask(Msg, Atom) :- write(Msg), flush_output, read_line_to_string(user_input, S), atom_string(Atom, S).

login_attempt(N) :- max_attempts(Max), N =< Max, !, ask('Username: ', U), ask('Password: ', P), ( user(U, P) -> writeln('Login Successful') ; writeln('Login Unsuccessful'), N1 is N + 1, login_attempt(N1) ).
login_attempt(_) :- writeln('Sorry, you exceeded the maximum number of attempts, try again later.').

% Run with:  ?- login.     (just type the text and press Enter, no dot needed, e.g.  ahmed)
