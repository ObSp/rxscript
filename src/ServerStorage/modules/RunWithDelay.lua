return function(WaitTime: number,action)
	task.spawn(function()
		task.wait(WaitTime)
		action()
	end)
end
