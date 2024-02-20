local module = {}
module.__index = module

function module:QueueEvent()
	task.spawn(function()
		while task.wait(self.TimeWait) do
			self.Event:Fire()
		end
	end)
end

return function(TimeWait: number)
	local newtimer = setmetatable({}, module)
	newtimer.TimeWait = TimeWait
	newtimer.Event = Instance.new("BindableEvent")
	newtimer:QueueEvent()
	return newtimer.Event.Event
end
