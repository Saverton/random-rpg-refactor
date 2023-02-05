local COLORS = require 'src/colors'
local Input = require 'lib/Input'
local Character = Class{}

local SPEED = 50 -- pixels/second

local DIRECTION_CHOICES = {
  up = {x = 0, y = -1},
  right = {x = 1, y = 0},
  down = {x = 0, y = 1},
  left = {x = -1, y = 0}
}

function Character:init()
  self.width = 20
  self.height = 20
  self.x = 300
  self.y = 200
  self.color = COLORS[1]

  self:bindInput()
end

function Character:bindInput()
  self.input = Input()
  self.input:bind('w', 'up')
  self.input:bind('d', 'right')
  self.input:bind('s', 'down')
  self.input:bind('a', 'left')
end

function Character:update(dt)
  local direction = self:getInputDirection()
  self.x = self.x + (direction.x * SPEED * dt)
  self.y = self.y + (direction.y * SPEED * dt)
end

-- returns a movement modifying object (with x and y keys) based on keyboard input
function Character:getInputDirection()
  local direction = {x = 0, y = 0}

  -- translate direction inputs into a movement modifying direction object
  for dir, value in pairs(DIRECTION_CHOICES) do
    if self.input:down(dir) then
      direction.x = direction.x + value.x
      direction.y = direction.y + value.y
    end
  end

  -- if both direction modifiers are active, reduce them by sqrt(2) to retain normal movement speed
  if direction.x ~= 0 and direction.y ~= 0 then
    direction.x = direction.x / math.sqrt(2)
    direction.y = direction.y / math.sqrt(2)
  end

  return direction
end

function Character:render()
  love.graphics.setColor(self.color)
  love.graphics.rectangle(
    'fill',
    math.floor(self.x),
    math.floor(self.y),
    self.width,
    self.height
  )
  love.graphics.setColor(1, 1, 1, 1)
end

function Character:center()
  return self.x + math.floor(self.width / 2),
         self.y + math.floor(self.height / 2)
end

return Character