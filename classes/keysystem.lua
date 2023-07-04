local data, utils

_G.KSS.OnStart.Event:Connect(function()
	data = _G.KSS.data
	utils = _G.KSS.utils
end)


local KeySystemClass = {}
KeySystemClass.__index = KeySystemClass

type TKeySystemClass = {
	GetKeyURL: () -> string
}

type TKey = {
	hwid: string,
  key: string,
  time_expired: number,
  checkpoint: number,
  finish: boolean,
  last_visit: number
}

type TApplication = {
  name: string,
  created_at: string,
  website_settings: {
    title: string,
    description: string,
    image: string,
    icon: string,
    color: string,
    widget_id: string,
    analytics_google_code: string
  },
  checkpoints: number,
}

function KeySystemClass.new(name: string): TKeySystemClass
	local self: TKeySystemClass = setmetatable({}, KeySystemClass)
	self.name = name
	
	return self
end

function KeySystemClass:getKeyURL(): string
	return data.url_root .. "/getkey/" .. self.name .. "?hwid=" .. utils:getHWID()
end

function KeySystemClass:copyGetKeyURL()
	local url = self:getKeyURL()
	if setclipboard then
		setclipboard(url)
	else
		warn("Not supported setclipboard")
	end
end

function KeySystemClass:urlKeyData(): string
	return data.api_url .. "/key/me?name=" .. self.name .. "&hwid=" .. utils:getHWID()
end

function KeySystemClass:keyData()
	return _G.KSS.JSONParse(self:urlKeyData()) 
end

function KeySystemClass:applicationData()
	return _G.KSS.JSONParse(data.api_url .. "/application/get?name="..self.name)
end

function KeySystemClass:key()
	return _G.KSS.classes.key.new(self:keyData())
end

return KeySystemClass