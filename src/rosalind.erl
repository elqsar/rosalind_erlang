-module(rosalind).

%% mylib: mylib library's entry point.

-export([dna_count/1, dna_to_rna/1, dna_to_rna_opt/1, dna/1, complement/1, gc_content/1]).
-export([quick/1]).
-export([hamming/2, hamming2/2]).
-export([fib/1, rabit_recurrence/2]).

%% API

% Dna count one
dna_count(Seq) ->
  dna_count(Seq, {0, 0, 0, 0}).

dna_count([], Acc) -> Acc;
dna_count([H|T], {A, B, C, D}) when H == $A ->
  dna_count(T, {A + 1, B, C, D});
dna_count([H|T], {A, B, C, D}) when H == $C ->
  dna_count(T, {A, B + 1, C, D});
dna_count([H|T], {A, B, C, D}) when H == $G ->
  dna_count(T, {A, B, C + 1, D});
dna_count([H|T], {A, B, C, D}) when H == $T ->
  dna_count(T, {A, B, C, D + 1}).

% Dna count two
dna(Str) ->
  dna(Str, #{}).

dna([H|T], Acc) ->
  case maps:is_key(H, Acc) of
    false -> dna(T, maps:put(H, 1, Acc));
    true -> dna(T, maps:put(H, maps:get(H, Acc) + 1, Acc))
  end;
dna([], Acc) -> maps:values(Acc).

% N finbonacci number
fib(0) -> 0;
fib(N) ->
  fib({0, 1}, N - 1).

fib({_, B}, 0) -> B;
fib({A, B}, N) ->
  fib({B, A + B}, N - 1).

% Simple quick search
quick([]) -> [];
quick([Pivot|T]) ->
  quick([X || X <- T, X < Pivot]) ++ [Pivot] ++ quick([X || X <- T, X >= Pivot]).

% Dna to Rna one
dna_to_rna(S) ->
  [change(X) || X <- S].

change(A) when A == $T -> $U;
change(A) -> A.

% Dna to Rna two
dna_to_rna_opt(S) ->
  dtr(S, []).

dtr([], Acc) -> lists:reverse(Acc);
dtr([H|T], Acc) ->
  case H == $T of
    true -> dtr(T, [$U|Acc]);
    false -> dtr(T, [H|Acc])
  end.

% The Secondary and Tertiary Structures of DNA
complement(Dna) ->
  Symbols = maps:from_list(lists:zip("ATCG", "TAGC")),
  [maps:get(X, Symbols) || X <- lists:reverse(Dna)].

% Rabbits and Recurrence Relations
rabit_recurrence(Month, Reproduction) ->
  rabit_recurrence({1, 1}, Month - 1, Reproduction).

rabit_recurrence({_A, B}, 1, _Reproduction) -> B;
rabit_recurrence({A, B}, Month, Reproduction) ->
  rabit_recurrence({B, A * Reproduction + B}, Month - 1, Reproduction).

gc_content(Dna) ->
  {Result, _} = lists:partition(fun(X) -> (X == $C) or (X == $G) end, Dna),
  length(Result) / length(Dna).

hamming(First, Second) ->
  hamming(First, Second, 0).

hamming([], [], Acc) -> Acc;
hamming([H|T], [H1|T2], Acc) ->
  case H =/= H1 of
    true -> hamming(T, T2, Acc + 1);
    false -> hamming(T, T2, Acc)
  end.

hamming2(First, Second) ->
  length([X || {X, Y} <- lists:zip(First, Second), X =/= Y]).



%% Internals


%% End of Module.
