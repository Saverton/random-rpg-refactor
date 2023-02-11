local function generateQuads(img_path, width, height)
  local img = love.graphics.newImage(img_path)

  local i_width, i_height = img:getDimensions()

  local quads = {}
  for y = 0, i_height, height do
    for x = 0, i_width, width do
      local new_quad = love.graphics.newQuad(x, y, width, height, i_width, i_height)
      table.insert(quads, new_quad)
    end
  end
  return quads
end

SPRITES = {
  player = {
    texture = love.graphics.newImage('graphics/entities/character.png'),
    quads = generateQuads('graphics/entities/character.png', 16, 16)
  },
  tiles = {
    texture = love.graphics.newImage('graphics/map/tiles.png'),
    quads = generateQuads('graphics/map/tiles.png', 16, 16)
  }
}