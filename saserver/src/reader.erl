-module(reader).
-export([getBanners/1]).
-include("dict.hrl").

getBanners(Path) -> 
	case file:read_file(Path) of
		{ok, Data} -> parse(Data);
		{error, _} -> []
	end.

parse(Data) ->
	Decoded = try jiffy:decode(Data)
		catch 
				_:_ -> []
		end,
	makeBanners(Decoded).

% TODO: find funcs
convertItem(Item) ->
	{[{_, Type}, {_, Img}, {_, Url}]} = Item,
	#banner{type = Type, image = Img, url = Url}.

makeBanners(List) -> 
	[convertItem(Item) || Item <- List].
