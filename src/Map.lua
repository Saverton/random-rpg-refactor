local Map = Class{}

local TILE_SIZE = 16

function Map:init(width, height)
  self.width = width
  self.height = height
end

function Map:render(camera)
  -- only render what is on screen
  local cx, cy = camera:worldCoords(0, 0, 0, 0, V_WIDTH, V_HEIGHT)
  local start = {
    x = math.max(0, math.floor(cx / TILE_SIZE)),
    y = math.max(0, math.floor(cy / TILE_SIZE))
  }
  local stop = {
    x = math.min(self.width, 
      math.floor((cx + V_WIDTH) / TILE_SIZE) + 1
    ),
    y = math.min(self.height,
      math.floor((cy + V_HEIGHT) / TILE_SIZE) + 1
    )
  }

  for y = start.y, stop.y, 1 do
    for x = start.x, stop.x, 1 do
      -- set color to checkerboard pattern
      -- if (y + x) % 2 == 0 then
      --   love.graphics.setColor(0, 0, 0, 1)
      -- else
      --   love.graphics.setColor(1, 1, 1, 1)
      -- end

      -- love.graphics.rectangle('fill', (x * TILE_SIZE), (y * TILE_SIZE), TILE_SIZE, TILE_SIZE)
      love.graphics.draw(SPRITES.tiles.texture, SPRITES.tiles.quads[1], (x * TILE_SIZE), (y * TILE_SIZE))
    end
  end

  love.graphics.setColor(1, 1, 1, 1)
end

function Map:dimensions()
  return self.width * TILE_SIZE, self.height * TILE_SIZE
end

return Map