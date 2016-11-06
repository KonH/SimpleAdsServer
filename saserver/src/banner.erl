-module(banner).
-export([filter/2, rand/1, rand/2]).
-include("dict.hrl").

filterItem(Item, Type) -> 
	ItemType = Item#banner.type, 
	ItemType == Type.

filter(List, Type) ->
	Filter = fun(Item) -> filterItem(Item, Type) end,
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

