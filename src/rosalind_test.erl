%%%-------------------------------------------------------------------
%%% @author Boris
%%% @doc
%%%
%%% @end
%%% Created : 29. VII 2015 17:52
%%%-------------------------------------------------------------------
-module(rosalind_test).
-author("Boris").

-include_lib("eunit/include/eunit.hrl").

dna_test() ->
  ?assertEqual(rosalind:dna_count("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"), {20, 12, 17, 21}).

dna_opt_test() ->
  ?assertEqual(rosalind:dna("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"), [20, 12, 17, 21]).


fib_test() ->
  ?assertEqual(rosalind:fib(6), 8),
  ?assertEqual(rosalind:fib(0), 0).

quick_test() ->
  ?assertEqual(rosalind:quick([5,7,1,10,7,2,5]), [1,2,5,5,7,7,10]).

dna_to_rna_test() ->
  ?assertEqual(rosalind:dna_to_rna("GATGGAACTTGACTACGTAAATT"), "GAUGGAACUUGACUACGUAAAUU"),
  ?assertEqual(rosalind:dna_to_rna_opt("GATGGAACTTGACTACGTAAATT"), "GAUGGAACUUGACUACGUAAAUU").
