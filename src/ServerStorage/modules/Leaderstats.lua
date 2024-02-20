local ldfuncs = {}

function ldfuncs.Create(player: Player, template: {})
	local ld = Instance.new("Folder")
	ld.Name = "leaderstats"
	ld.Parent = player
	for item, value in template do
		local newval = Instance.new(value[1])
		newval.Name = item
		if value[2] then newval.Value = value[2] end
		newval.Parent = ld
	end
	return ld
end

function ldfuncs.Auto(template: {})
	game.Players.PlayerAdded:Connect(function(player)
		ldfuncs.Create(player, template)
	end)
end

return ldfuncs