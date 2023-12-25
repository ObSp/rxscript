local module = {}

function module.SetCameraScriptable()
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
end

function module.SetCameraDefault()
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
end


return module
