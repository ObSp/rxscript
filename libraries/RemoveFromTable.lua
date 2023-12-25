return function(t, value)
	for i,v in t do
		if v == value then table.remove(t,i) end
	end
	return t
end
