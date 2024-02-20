local Players = game:GetService("Players")

local Cache = {}

local DSFunctions = {}
DSFunctions.__index = DSFunctions

function DSFunctions:SaveData(UserId, SaveData)
	local data = {}
	
	for i,v in SaveData do
		if type(v) ~= "number" and type(v) ~= "string" then
			if self.Settings.AutoConvertToString then
				print("Converting "..type(v).." into datatype: string.")
				v = tostring(v)
			else
				warn("Data type of "..tostring(v), type(v).." is not a supported data type and couldn't be saved. Turn on AutoConvertToString in settings to silence.")
				continue
			end
		end
		data[self.Template[i]] = v
	end
	
	print("Data successfully converted into a saveable table")
	
	local success, err = pcall(function()
		self.DataStore:SetAsync(UserId, data)
	end)
	
	if err then warn("Data failed to save: "..err) return err end
	
	return data
end

function DSFunctions:GetData(UserId)
	local data

	local success, err = pcall(function()
		data = self.DataStore:GetAsync(UserId)
	end)

	if not data then print("Key "..UserId.." is not associated with any data") return end

	if err then
		warn("Failed to retrieve save: "..err)
		if self.Settings.AutoKickPlayers then Players:GetPlayerByUserId(UserId):Kick(self.Settings.LoadErrorKickMessage) end
		return end

	return data
end

function DSFunctions:AddRequestToCache(UserId, DataToSave)
	self.Cache[UserId] = DataToSave
	return self
end

function DSFunctions:ClearCache()
	table.clear(self.Cache)
	return self
end

function DSFunctions:_SaveCache(Cache)
	for key,data in self.Cache do
		if not data then continue end
		self:SaveData(key, data)
		self:RemoveFromCache(key)
		print("Saved "..key.."'s data")
		task.wait(.1)
	end
end

function DSFunctions:InitializeCache()
	local function GetValueFromPath(start: Player, path: string)
		local current = start
		for _,pathItem in path:split(".") do
			local item = current[pathItem]
			if not item then error(`Instance {pathItem} not found in parent {current.Name}}`) end
			current = item
		end
	end
	task.spawn(function()
		while task.wait(self.Settings.CacheCycleTime) do
			for _, plr in game.Players:GetPlayers() do
				local saveTable = {}
				for k,v in self.Template do
					saveTable[k] = GetValueFromPath(plr, v)
				end
				self:AddRequestToCache(plr.UserId, saveTable)
			end
			self:_SaveCache()
		end
	end)
end

function DSFunctions:GetCache()
	return self.Cache
end

function DSFunctions:RemoveFromCache(key)
	self.Cache[key] = nil
	return self
end


return function(Name, Template: {}, SaveType, Settings: {})
	local self = setmetatable({}, DSFunctions)
	self.DataStore = game:GetService("DataStoreService"):GetDataStore(Name)
	self.Template = Template
	self.SaveType = SaveType
	self.Settings = Settings
	self.Cache = {}
	return self
end


--[[	USAGE EXAMPLE:


local NumberDS = rxscript.GetDataStore("Numbers", {"Number" = ".leaderstats.Number.Value"}, "Leaderstats", rxscript.InstanceTypes.DataStoreSettings(true,true,nil, 5))

game.Players.PlayerAdded:Connect(function(plr)
	local leaderstats = api.CreateLeaderstats(plr,{
		Number = {"IntValue",10}
	})
	
	local data = NumberDS:GetData(plr.UserId)
	if not data then return end
	leaderstats.Number.Value = data.Number
end)

game.Players.PlayerRemoving:Connect(function(plr)
	NumberDS:AddRequestToCache(plr.UserId, {plr.leaderstats.Number.Value})
end)

game:BindToClose(function()
	for key,data in NumberDS:GetCache() do
		NumberDS:SaveData(key,data)
		NumberDS:RemoveFromCache(key)
	end
end)

task.spawn(function() (to save every player's data every cachecycletime seconds)
	while task.wait(NumberDsSettings.CacheCycleTime-1) do
		for _,plr in game.Players:GetPlayers() do
			NumberDS:AddRequestToCache(plr.UserId, {plr.leaderstats.Number.Value})
		end
	end
end)]]--