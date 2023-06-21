local Utils = {}

function Utils.getHWID()
	return string.gsub(game:GetService("RbxAnalyticsService"):GetClientId(), "-", "")
end

return Utils