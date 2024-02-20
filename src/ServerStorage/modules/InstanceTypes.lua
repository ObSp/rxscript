-- Not much yet, more will be added as I continue writing modules for rxscript, as of now you can just make your own InstanceTypes here!

local module = {}

function module.DataStoreSettings(AutoConvertToString: boolean, AutoKickPlayers: boolean, ErrorKickMessage: string, AutoCachePlayers,CacheCycleTime: number)
	return {
		AutoConvertToString = AutoConvertToString or false, 
		AutoKickPlayers = AutoConvertToString or false,
		ErrorKickMessage=ErrorKickMessage or "Your data has failed to load, please rejoin the game",
		AutoCachePlayers = AutoCachePlayers or false,
		CacheCycleTime = CacheCycleTime or 60
	}
end


return module
