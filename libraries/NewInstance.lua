local module = {}
local InstanceTypes = require(script.Parent.InstanceTypes)

return function(InstanceName)
	local newinstance = nil
	local isRBXInstance = pcall(function()
		newinstance = Instance.new(InstanceName)
	end)
	local isCustomInstance = pcall(function()
		newinstance = InstanceTypes[InstanceName]()
	end)
	
	if not newinstance then error("Not a recognized roblox or rxscript instance, please check the spelling of the instance class name") end
	return newinstance
end
