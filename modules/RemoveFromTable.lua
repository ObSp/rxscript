return function(t, value)
	table.remove(t, table.find(t, value))
	return t
end
