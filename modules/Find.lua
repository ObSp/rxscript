return function(parent: Instance, path: string)
	local last: Instance = parent 
	
	
	for _,item in string.split(path, ".") do
		local child = last:FindFirstChild(item)
		
		if not child then
			error(`Child not found, "{item}" is not a valid member of {parent:GetFullName()}, please check if the path "{path}" is valid`, 2)
		end
		last = child
	end
	
	
	return last
end
