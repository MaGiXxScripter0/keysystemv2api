local HttpService = game:GetService("HttpService")
local urlGithub = "https://raw.githubusercontent.com/MaGiXxScripter0/keysystemv2api/master"

loadstring("return"..game:HttpGet(urlGithub .. "/data.json"))()