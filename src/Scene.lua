Map = require 'src/Map'
Character = require 'src/Character'
CameraDependent = require 'src/CameraDependent'

local Scene = Class{__includes = CameraDependent}

function Scene:init()
  self.map = Map(50, 50)
  self.character = Character(self.map)
  self.camera = CameraManager(self.character, self.map, {self.map})
end

function Scene:update(dt)
  self.character:update(dt)

  -- update camera position, prevent from going off map
  self.camera:update(dt)
end

function Scene:render()
  -- render with the camera's context
  self.camera:render(function ()
    self.map:render()
    self.character:render()
  end)
end

return Scene