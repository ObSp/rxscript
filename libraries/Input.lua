local UIS = game:GetService("UserInputService")

local inputFunctions = {}
inputFunctions.__index = inputFunctions

function inputFunctions:ConnectFunction(func)
	self._active = true
	if func then
		self.func = func
	end
	UIS.InputBegan:Connect(function(key, processed)
		if (not table.find(self.Triggers,key.KeyCode) and not table.find(self.Triggers,key.UserInputType)) or processed or not self._active then return end
		self.func()
	end)
	return self
end

function inputFunctions:DisconnectSelf()
	self._active = false
	return self
end

function inputFunctions:ReconnectSelf()
	self._active = true
	return self
end

function inputFunctions:SetTriggers(Triggers)
	self.Triggers = Triggers
	return self
end


return function(Triggers: {}, func: any?)
	local obj = setmetatable({}, inputFunctions)
	obj.Triggers = Triggers
	obj._active = false
	if func then
		obj.func = func
		obj._active = true
		obj:ConnectFunction()
	end
	return obj
end
