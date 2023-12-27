local UIS = game:GetService("UserInputService")

local inputFunctions = {}
inputFunctions.__index = inputFunctions

function inputFunctions:BindToPress(func)
	if self._pressfunc() then self._pressfunc:Disconnect() end
	self._active = true
	self._pressfunc = func
	UIS.InputBegan:Connect(function(key, processed)
		if (not table.find(self.Triggers,key.KeyCode) and not table.find(self.Triggers,key.UserInputType)) or processed or not self._active then return end
		self._pressfunc()
	end)
	return self
end

function inputFunctions:BindToRelease(func)
	if self._releasefunc() then self._releasefunc:Disconnect() end
	self._active = true
	self._releasefunc = func
	UIS.InputEnded:Connect(function(key, processed)
		if (not table.find(self.Triggers,key.KeyCode) and not table.find(self.Triggers,key.UserInputType)) or processed or not self._active then return end
		self._releasefunc()
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


return function(Triggers: {})
	local obj = setmetatable({}, inputFunctions)
	obj.Triggers = Triggers
	obj._active = false
	return obj
end