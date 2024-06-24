local task = {}
function task.wait(x: number)
	local start = tick()
end



local module = {}
module.__index = module

function module:QueueEvent()
	task.spawn(function()
		while task.wait(self.TimeWait) do
			if not self._stopped then self.Event:Fire() end
			if not self.TimeWait then return end
		end
		return
	end)
end

function module:Stop()
	self._stopped = true
	return self
end

function module:Resume()
	self._stopped = false
	return self
end

function module:Remove()
	self = {}
	return self
end

return function(TimeWait: number)
	local newtimer = setmetatable({}, module)
	newtimer.TimeWait = TimeWait
	newtimer.Event = Instance.new("BindableEvent")
	newtimer:QueueEvent()
	newtimer._stopped = false
	return newtimer.Event.Event
end
