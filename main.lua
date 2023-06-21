local HttpService = game:GetService("HttpService")
local urlGithub = "https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master"

_G.KeySystemStorage = {}
local storage = _G.KeySystemStorage

function registerStorage(path: string)
	local paths = string.split(path, "/")
	local endFile = paths[#paths]
	local endFileType = string.split(endFile, ".")[2]
	local oldStorage = storage
	for _, path_split in paths do
		if path_split == "" then continue end
		local name = string.split(path_split, ".")[1]
		oldStorage[name] = oldStorage[name] or {}
		oldStorage = oldStorage[name]
		if path_split == endFile then
			if endFileType == 'json' then
				local data = HttpService:JSONDecode(game:HttpGet(urlGithub .. path))
				oldStorage = data
			elseif endFileType == 'lua' then
				local soure = loadstring(game:HttpGet(urlGithub .. path))()
				oldStorage = soure
			end
		end
	end
end

registerStorage("/data.json")
registerStorage("/utils/utils.lua")
registerStorage("/classes/keysystem.lua")
registerStorage("/version.json")
