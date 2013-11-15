-module(quicksort).
-compile(export_all).

%% quicksort :D 
qsort([]) ->
  [];
qsort([Pivot | List]) ->
  {L, M, R} = split(Pivot, [Pivot | List], [], [], []),
  qsort(L) ++ M ++ qsort(R).

split(_, [], L, M, R) ->
  {L, M, R};
split(Pivot, [H | T], L, M, R) ->
  if H == Pivot -> split(Pivot, T, L, [H | M], R);
     H <  Pivot -> split(Pivot, T, [H | L], M, R);
     H >  Pivot -> split(Pivot, T, L, M, [H | R])
  end.

