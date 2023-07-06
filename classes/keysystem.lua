local data, utils, APIService

_G.KSS.OnStart.Event:Connect(function()
	data = _G.KSS.data
	utils = _G.KSS.utils
	APIService = _G.KSS.classes.APIService
end)

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

local KeySystemClass = {} do
	KeySystemClass.__index = KeySystemClass

	function KeySystemClass.new(name: string): TKeySystemClass
		local self: TKeySystemClass = setmetatable({}, KeySystemClass)
		self.name = name
		
		return self
	end

	function KeySystemClass:copyGetKeyURL(): nil
		local url = APIService:getKeyURL(self.name)
		if setclipboard then
			setclipboard(url)
		else
			warn("Not supported setclipboard")
		end
	end

	function KeySystemClass:key(): TKey
		return _G.KSS.classes.key.new(APIService:keyData(self.name))
	end

	function KeySystemClass:premiumKey(key: string): TKey
		return _G.KSS.classes.key.new(APIService:premiumKeyData(self.name, key))
	end
end

return KeySystemClass