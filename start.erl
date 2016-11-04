-module(start).
-export([getInfo/0]).

% TODO:
% - Read json file with links and image urls
% - Get random item from it
% - Return json generated from it
% - Web-service:
% -- Local
% -- Cloud (AWS/Heroku?)
% JSON input: [{img, url, refresh_rate}]
% JSON output:[{img, url, refresh_rate}]
% Return ad info set (image, url)
getInfo() -> 
	[
		[image, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMt5w6ogKb6CzPsvoIJT-doHThUuOMBWciXoOk4OsRUfXRmMM9"], 
		[url, "https://www.google.com/"
	]].
