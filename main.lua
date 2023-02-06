Timer = require 'lib/timer'
Class = require 'lib/class'
Positionable = require 'src/Positionable'
Bindable = require 'src/Bindable'
CameraManager = require 'src/CameraManager'
Scene = require 'src/Scene'

local push = require 'lib/push'


require 'src/sprites'

local scene

-- window dimensions
V_WIDTH, V_HEIGHT = 256, 144
W_WIDTH, W_HEIGHT = love.window.getDesktopDimensions()
W_WIDTH, W_HEIGHT = W_WIDTH * 0.7, W_HEIGHT * 0.7

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')

  push:setupScreen(V_WIDTH, V_HEIGHT, W_WIDTH, W_HEIGHT, {resizable = true, fullscreen = false})

  scene = Scene()
end

function love.resize(width, height)
  push:resize(width, height)
end

function love.update(dt)
  scene:update(dt)
end

function love.draw()
  push:start()
  scene:render()
  push:finish()
end