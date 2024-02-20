return function(seconds: number)
	local start_time = DateTime.now().UnixTimestampMillis
	repeat game:GetService("RunService").Stepped:Wait() until DateTime.now().UnixTimestampMillis >= start_time+seconds*1000
	return (DateTime.now().UnixTimestampMillis-start_time)/1000
end
