local HttpService = game:GetService("HttpService")
local urlGitHub = "https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master"

_G.KSS = {}
local storage = _G.KSS

function registerStorage(path: string)
	local paths = string.split(path, "/")
	local endFile = paths[#paths]
	local endFileType = string.split(endFile, ".")[2]
	local oldStorage = storage
	for _, path_split in paths do
		if path_split == "" then continue end
		local name = string.split(path_split, ".")[1]
		oldStorage[name] = oldStorage[name] or {}
		if path_split == endFile then
			if endFileType == 'json' then
				oldStorage[name] = _G.KSS.JSONParse(urlGitHub .. path)
			elseif endFileType == 'lua' then
				oldStorage[name] = _G.KSS.LuaParse(urlGitHub .. path)
			end
		end
		oldStorage = oldStorage[name]
	end
end

_G.KSS.JSONParse = function(path: string)
	return HttpService:JSONDecode(game:HttpGet(path))
end

_G.KSS.LuaParse = function(path: string)
	return loadstring(game:HttpGet(path))()
end

_G.KSS.registerStorage = registerStorage
_G.KSS.OnStart = Instance.new("BindableEvent")

getgenv().setclipboard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

registerStorage("/data.json")
registerStorage("/classes/init.lua")
registerStorage("/utils.lua")

_G.KSS.OnStart:Fire(true)