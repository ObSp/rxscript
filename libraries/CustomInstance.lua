local customInstanceMethods = {}
customInstanceMethods.__index = customInstanceMethods
customInstanceMethods.__tostring = function(self)
	return self.Name or `Attempted to print nonexistent instance`
end


function customInstanceMethods:Destroy()
	if self._isrbx then self.Instance:Destroy() end
	for prop,_ in self do
		self[prop] = nil
	end
	return self
end

return function(Name, rbxInstance, Properties: {})
	local newCustom = setmetatable({}, customInstanceMethods)
	newCustom.Name = Name
	
	newCustom.Instance = rbxInstance
	if typeof(rbxInstance) == "Instance" then
		newCustom._isrbx = true
	else
		newCustom._isrbx = false
	end
	
	for property,value in Properties do
		newCustom[property] = value
	end
	
	return newCustom
end
