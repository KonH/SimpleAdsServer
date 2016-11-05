-module(start).
-export([askBanner/1]).

% TODO:
% - Read and parse json file with links and image urls
% + Get random item from it
% - Return json generated from it
% - Web-service:
% -- Local
% -- Cloud (AWS/Heroku?)
% JSON input: [{type, img, url}]
% JSON output:{img, url}
% Request: {userId, type}

% Return ad info set (image, url)
%getInfo() -> 
%	{
%		{image, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMt5w6ogKb6CzPsvoIJT-doHThUuOMBWciXoOk4OsRUfXRmMM9"}, 
%		{url, "https://www.google.com/"}
%	}.

getEntries() ->
	[
		{{type,"small"}, {image, "img1"}, {url, "url1"}},
		{{type,"small"}, {image, "img2"}, {url, "url2"}},
		{{type,"small"}, {image, "img3"}, {url, "url3"}},
		{{type,"big"},   {image, "img4"}, {url, "url4"}},
		{{type,"big"},   {image, "img5"}, {url, "url5"}},
		{{type,"big"},   {image, "img6"}, {url, "url6"}}
	].

askBanner(Type) ->
	List = getEntries(),
	Entry = entry:rand(List, Type),
	entry:apply(Entry).
