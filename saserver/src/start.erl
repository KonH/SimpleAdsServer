-module(start).
-export([askBanner/1]).

% TODO:
% + Read and parse json file with links and image urls
% + Get random item from it
% - Return json generated from it
% - Web-service:
% -- Local
% -- Cloud (AWS/Heroku?)
% JSON input: [{type, image, url}]
% JSON output:{image, url}
% Request: {userId, type}

% Return ad info set (image, url)
%getInfo() -> 
%	{
%		{image, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMt5w6ogKb6CzPsvoIJT-doHThUuOMBWciXoOk4OsRUfXRmMM9"}, 
%		{url, "https://www.google.com/"}
%	}.

askBanner(Type) ->
	Path = "/Users/konh/Projects/Erlang/SimpleAdsServer/content.json",
	List = reader:getEntries(Path),
	Entry = entry:rand(List, Type),
	entry:apply(Entry).
