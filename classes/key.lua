local utils

_G.KSS.OnStart.Event:Connect(function()
	utils = _G.KSS.utils
end)

local KeyClass = {}
KeyClass.__index = KeyClass

type TKey = {
	hwid: string,
	key: string,
	time_expired: number,
	checkpoint: number,
	finish: boolean,
	last_visit: number
}

function KeyClass.new(keyData: TKey): TKey
	local self = setmetatable({}, KeyClass)
	for i, v in pairs(keyData) do
		self[i] = v
	end
	return self
end

function KeyClass:verifyHWID(): string
	if self.hwid == utils:getHWID() then
			return true
	end
	return false
end

function KeyClass:verifyKey(key: string): string
	if self.key == key then
			return true
	end
	return false
end

return KeyClass