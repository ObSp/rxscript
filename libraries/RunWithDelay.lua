return function(WaitTime: number,action)
	task.wait(WaitTime)
	action()
end
