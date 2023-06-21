local Utils = {}

function Utils.getHWID()
	local hwid = string.gsub(game:GetService("RbxAnalyticsService"):GetClientId(), "-", "")
	return hwid
end

return Utils