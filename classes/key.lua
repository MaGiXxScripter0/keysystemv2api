local utils = _G.KSS.utils

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
	self.data = keyData
	return self
end

function KeyClass:verifyHWID(): string
	if self.data.hwid == utils:getHWID() then
			return true
	end
	return false
end

function KeyClass:verifyKey(key: string): string
	if self.data.key == key then
			return true
	end
	return false
end

return KeyClass