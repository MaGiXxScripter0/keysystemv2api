local utils

_G.KSS.OnStart.Event:Connect(function()
	utils = _G.KSS.utils
end)

type TPremiumKey = {
    hwid: string,
    key: string,
    time_expired: number,
    created_at: string,
    executed: int,
    last_used: string,
    note: string,
    is_expired: boolean
}

local PremiumKeyClass = {} do
    PremiumKeyClass.__index = KeyClass

    function PremiumKeyClass.new(keyData: TPremiumKey): TKey
        local self = setmetatable({}, KeyClass)
        for i, v in pairs(keyData) do
            self[i] = v
        end
        return self
    end

    function PremiumKeyClass:verifyHWID(): boolean
        if self.hwid == utils:getHWID() then
            return true
        end
        return false
    end

    function PremiumKeyClass:verifyKey(key: string): boolean
        if self.key == key then
            return true
        end
        return false
    end

    function PremiumKeyClass:verifyAll(key: string): boolean
        if self:verifyHWID() and self:verifyKey(key) and self.is_expired == false then
            return true
        end
        return false
    end
end

return KeyClass