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
	Entries = makeEntries(Decoded),
	Entries.

convertItem(Item) ->
	{Content} = Item,
	[TypeTuple, ImgTuple, UrlTuple] = Content,
	{_, Type} = TypeTuple,
	{_, Img} = ImgTuple,
	{_, Url} = UrlTuple,
	{{type, Type}, {image, Img}, {url, Url}}.

makeEntries(List) -> 
	Convert = fun(Item) -> convertItem(Item) end,
	ConvList = lists:map(Convert, List),
	ConvList.
