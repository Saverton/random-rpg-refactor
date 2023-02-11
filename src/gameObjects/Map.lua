local Map = Class{__includes = {Positionable, CameraDependent}}

local TILE_SIZE = 16

function Map:init(width, height)
  Positionable.init(self, 0, 0, width * TILE_SIZE, height * TILE_SIZE)
  self.grid_width, self.grid_height = width, height
  CameraDependent.init(self,
    math.ceil(V_WIDTH / 2),
    math.ceil(V_HEIGHT / 2)
  )
end

function Map:render()
  -- only render what is actually on screen
  local bounds = CameraDependent.getDependency(self, TILE_SIZE)

  for y = bounds.min_y, bounds.max_y, 1 do
    for x = bounds.min_x, bounds.max_x, 1 do
      love.graphics.draw(SPRITES.tiles.texture, SPRITES.tiles.quads[1], (x * TILE_SIZE), (y * TILE_SIZE))
    end
  end

  love.graphics.setColor(1, 1, 1, 1)
end

function Map:dimensions()
  return self.width, self.height
end

return Map