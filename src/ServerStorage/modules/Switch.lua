-- an imitation of C#'s switch cases
local switchfuncs = {}
switchfuncs.__index = switchfuncs

switchfuncs.__call = function(self, var)
	local case = self._returns[var] or self._default
	
	if not case then
		error("No such case, please set a :default or make sure the case exists")
	end
	
	case()
	
end

function switchfuncs:case(var,func)
	self._returns[var] = func
	return self
end

function switchfuncs:default(func)
	self._default = func
	return self
end


return function()
	local Switch = setmetatable({}, switchfuncs)
	switchfuncs._returns = {}
	return Switch
end
