-module(reader).
-export([getEntries/1]).

getEntries(Path) -> 
	case file:read_file(Path) of
		{ok, Data} -> parse(Data);
		{error, _} -> []
	end.

% TODO: Catch exceptions
parse(Data) ->
	Decoded = jiffy:decode(Data),
	makeEntries(Decoded).

convertItem(Item) ->
	{[{_, Type}, {_, Img}, {_, Url}]} = Item,
	{{type, Type}, {image, Img}, {url, Url}}.

makeEntries(List) -> 
	[convertItem(Item) || Item <- List].
