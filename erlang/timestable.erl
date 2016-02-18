%% @doc This is a module version of the escript code
%%
%% Start erlang shell, compile and load it by typing
%% `c(timestable)'
%% `timestable:main()'
%% @end

-module(timestable).
-compile([export_all]).

timestable(N) ->
    compute_times(N, 12).

compute_times(_X, 0) ->
    ok;
compute_times(X, I) ->
    io:format(user, "~w x ~w = ~w~n", [X, I, X*I]),
    compute_times(X, I-1).

main() ->
    spawn_workers(12).

spawn_workers(0) ->
    ok;
spawn_workers(N) ->
    spawn(fun() -> timestable(N) end),
    spawn_workers(N-1).
