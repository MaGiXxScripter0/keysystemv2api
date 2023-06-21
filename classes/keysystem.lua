local data = loadstring()

local KeySystem = {}
KeySystem.__index = KeySystem

type TKeySystem = {
	GetKeyURL: () -> string
}

function KeySystem.new(name: string): TKeySystem
	local self: TKeySystem = setmetatable({}, KeySystem)
	self.name = name
	
	return self
end

function KeySystem:GetKeyURL(): string
	return 
end

return KeySystem