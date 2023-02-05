Timer = require 'lib/timer'
Class = require 'lib/class'
Camera = require 'lib/camera'
local push = require 'lib/push'

require 'src/sprites'

Map = require 'src/Map'
Character = require 'src/Character'

local map
local character

-- window dimensions
V_WIDTH, V_HEIGHT = 256, 144
W_WIDTH, W_HEIGHT = love.window.getDesktopDimensions()
W_WIDTH, W_HEIGHT = W_WIDTH * 0.7, W_HEIGHT * 0.7

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')

  push:setupScreen(V_WIDTH, V_HEIGHT, W_WIDTH, W_HEIGHT, {resizable = true, fullscreen = false})

  map = Map(50, 50)
  character = Character()

  GlobalCamera = Camera(character:center())
end

function love.resize(width, height)
  push:resize(width, height)
end

function love.update(dt)
  character:update(dt)

  -- update camera position, prevent from going off map
  local px, py = character:center()
  local mw, mh = map:dimensions()
  local fx, fy = math.max(0 + math.floor(V_WIDTH / 2), math.min(px, mw - math.floor(V_WIDTH / 2))),
                 math.max(0 + math.floor(V_HEIGHT / 2), math.min(py, mh - math.floor(V_HEIGHT / 2)))

  local dx, dy = fx - GlobalCamera.x, fy - GlobalCamera.y
  GlobalCamera:move(math.floor(dx / 2), math.floor(dy / 2))
end

function love.draw()
  push:start()
  GlobalCamera:attach(0, 0, V_WIDTH, V_HEIGHT)

  map:render()
  character:render()

  GlobalCamera:detach()
  push:finish()
end