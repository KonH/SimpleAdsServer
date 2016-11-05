-module(entry).
-export([filter/2, rand/1, rand/2, apply/1]).

filter(List, Type) ->
	Filter = fun(Entry) -> {{type, EntryType},_,_} = Entry, EntryType == Type end,
	TypeList = lists:filter(Filter, List),
	TypeList.

rand([]) -> 
	{};
rand(List) ->
	Index = random:uniform(length(List)),
	lists:nth(Index,List).

rand(List, Type) ->
	TypeList = filter(List, Type),
	rand(TypeList).

apply({}) ->
	{};
apply({_,{image,Img},{url,Url}}) ->
	{Img, Url}.

