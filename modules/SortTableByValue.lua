return function(dict: {})
	local list = {}
	for i,v in dict do
		table.insert(list, {i,v})
	end
	table.sort(list,
		function(a,b)
			return a[2]>b[2]
		end
	)
	local returnlist = {}
	
	for _,v in list do
		table.insert(returnlist, v[1])
	end
	
	return returnlist
end
