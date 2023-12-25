return function(parent: Instance, path:string, maxwait: number?)
	local st = os.time()
	local last = parent
	
	for _,pathitem in string.split(path, ".") do
		
		if maxwait and os.time()>st+maxwait then
			error("Exceeded maximum wait time, please make sure the instance exists and that your path is corrent")
		end
		
		local obj = last:WaitForChild(pathitem)
		last = obj
	end
	
	return last
end
