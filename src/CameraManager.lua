local Camera = require 'lib/camera'

local CameraManager = Class{__includes = {Positionable, Bindable}}

-- ALL targets & dependencies must inherit the Positionable interface!!!
function CameraManager:init(target, map, dependencies)
  self.target = target
  assert(self.target.isPositionable, 'CameraManager\'s target must implement the Positionable interface.')
  self.dependencies = dependencies or {}
  self:assertDependencies()
  self.camera = Camera.new(self.target:getCenter())

  local corner_x, corner_y = self:worldCoords(0, 0)
  Positionable.init(self, corner_x, corner_y, V_WIDTH, V_HEIGHT)
  Bindable.init(self, map)
end

function CameraManager:update(dt)
  local px, py = self.target:getCenter()
  local dx, dy = px - self.camera.x, py - self.camera.y
  self.camera:move(math.floor(dx / 2), math.floor(dy / 2))
  self:bind()

  self:updateDependencies()
end

function CameraManager:bind()
  self.x, self.y = self:worldCoords(0, 0)
  Bindable.bind(self)
  self.camera:lookAt(self:getCenter())
end

function CameraManager:render(func)
  self.camera:draw(0, 0, self.width, self.height, func)
end

function CameraManager:worldCoords(x, y)
  return self.camera:worldCoords(x, y, 0, 0, V_WIDTH, V_HEIGHT)
end

function CameraManager:updateDependencies()
  self:iterateDependencies(function (dependency)
    CameraDependent.updateDependency(dependency, self)
  end)
end

function CameraManager:assertDependencies()
  self:iterateDependencies(function (dependency)
    assert(dependency.isCameraDependent, 'Dependencies of CameraManager must implement the CameraDependent interface.')
  end)
end

function CameraManager:iterateDependencies(func)
  for _, dependency in pairs(self.dependencies) do
    func(dependency)
  end
end

return CameraManager