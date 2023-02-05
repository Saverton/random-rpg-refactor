
Map = require 'src/Map'
Character = require 'src/Character'

Scene = Class{}

function Scene:init()
  self.map = Map(50, 50)
  self.character = Character()
end

function Scene:update(dt)
  self.character:update(dt)

  -- update camera position, prevent from going off map
  local px, py = self.character:center()
  local mw, mh = self.map:dimensions()
  local fx, fy = math.max(0 + math.floor(V_WIDTH / 2), math.min(px, mw - math.floor(V_WIDTH / 2))),
                 math.max(0 + math.floor(V_HEIGHT / 2), math.min(py, mh - math.floor(V_HEIGHT / 2)))

  local dx, dy = fx - self.camera.x, fy - self.camera.y
  self.camera:move(math.floor(dx / 2), math.floor(dy / 2))
end

function Scene:render()
  self.camera:attach(0, 0, V_WIDTH, V_HEIGHT)

  self.map:render(self.camera)
  self.character:render()

  self.camera:detach()
end

return Scene