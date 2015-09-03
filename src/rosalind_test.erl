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

secondary_and_terteriary_test() ->
  ?assertEqual(rosalind:complement("AAAACCCGGT"), "ACCGGGTTTT"),
  ?assertEqual(rosalind:complement("GTCA"), "TGAC").

rabit_recurrence_test() ->
  ?assertEqual(rosalind:rabit_recurrence(5, 3), 19),
  ?assertEqual(rosalind:rabit_recurrence(36, 3), 3048504677680).

gc_content_test() ->
  ?assertEqual(rosalind:gc_content("AGCTATAG"), 0.375).

hamming_test() ->
  ?assertEqual(rosalind:hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"), 7).

hamming2_test() ->
  ?assertEqual(rosalind:hamming2("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"), 7).