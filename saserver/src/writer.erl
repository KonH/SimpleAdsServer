-module(writer).
-export([apply/1]).
-include("dict.hrl").

apply(Item) when is_record(Item, banner) ->
	#banner{image = Img, url = Url} = Item,
	jiffy:encode({[{image, Img}, {url, Url}]}).
