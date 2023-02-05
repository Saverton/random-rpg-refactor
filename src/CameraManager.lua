local Camera = require 'lib/camera'

local CameraManager = Class{}

-- ALL targets & dependencies must inherit the Positionable interface!!!
function CameraManager:init(target, dependencies)
  self.target = target
  self.dependencies = dependencies or {}
  self.camera = Camera.new(self.target:center())
end

function CameraManager:update(dt)

end

function CameraManager:render()

end