local data, utils

_G.KSS.OnStart.Event:Connect(function()
	data = _G.KSS.data
	utils = _G.KSS.utils
end)

local APIService = {} do
    function APIService:urlKeyData(name: string, key: string): string
		local key_query = key and '&key=' .. key or ''
		return data.api_url .. "/key/me?name=" .. name .. "&hwid=" .. utils:getHWID() .. '&verify=true' .. key_query
	end

    function APIService:urlPremiumKeyData(name: string, key: string): string
		return data.api_url .. "/premium_key/me?name=" .. name .. "&key=" .. key .. "&hwid=" .. utils:getHWID()
	end

    function APIService:getKeyURL(name: string): string
        return data.url_root .. "/getkey/" .. name .. "?hwid=" .. utils:getHWID()
    end

    function APIService:premiumKeyData(name: string, key: string)
		local data = _G.KSS.JSONParse(self:urlPremiumKeyData(name, key)) 
        return data
	end

    function APIService:keyData(name: string, key: string)
		return _G.KSS.JSONParse(self:urlKeyData(name, key)) 
	end

	function APIService:applicationData(name: string)
		return _G.KSS.JSONParse(data.api_url .. "/application/get?name=".. name)
	end
end

return APIService