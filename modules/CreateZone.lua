local module = {}
module.__index = module

function module:CheckForTouch()
	local touchingPlayers = {}
	local function getPlayer(part: BasePart)
		return game.Players:GetPlayerFromCharacter(part.Parent)
	end
	local function inList(tbl, obj)
		return table.find(tbl, obj)
	end
	game:GetService("RunService").Stepped:Connect(function()
		local tempPlayers = {}
		if not self.Zones then return end
		for _,zone: Part in self.Zones do
			local parts = workspace:GetPartBoundsInBox(zone.CFrame, zone.Size)
			for _, part in parts do
				local player = getPlayer(part)
				if player and not inList(tempPlayers, player) then
					table.insert(tempPlayers, player)
					if not inList(touchingPlayers, player) then
						self._EnterEvent:Fire(player)
						self.Touches += 1
					end
				end
			end
		end
		for _,plr in touchingPlayers do
			if not inList(tempPlayers, plr) then
				self._LeftEvent:Fire(plr)
			end
		end
		touchingPlayers = tempPlayers
	end)
end


function module:GetEvents()
	return {
		Entered = self.PlayerEntered.Event,
		Left = self.PlayerLeft.Event
	}
end

function module:GetTouchNumber()
	return self.Touches
end

function module:Delete()
	self.PlayerEntered:Destroy()
	self.PlayerLeft:Destroy()
	self.Zones = nil
end

return function(Container: Instance)
	local self = setmetatable({}, module)
	self.Name = Container.Name
	self._EnterEvent = Instance.new("BindableEvent")
	self._LeftEvent = Instance.new("BindableEvent")
	self.PlayerEntered = self._EnterEvent.Event
	self.PlayerLeft = self._LeftEvent.Event
	if not Container:IsA("Folder") and not Container:IsA("Model") then
		self.Zones = {Container}
	else
		self.Zones = Container:GetChildren()
	end
	self.Touches = 0
	self:CheckForTouch()
	return self
end
