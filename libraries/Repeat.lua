return function(Repeats: number, action)
	for i=1, Repeats do
		action()
	end
end
