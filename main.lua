require 'src/dependencies'

-- window dimensions
V_WIDTH, V_HEIGHT = 256, 144
W_WIDTH, W_HEIGHT = love.window.getDesktopDimensions()
W_WIDTH, W_HEIGHT = W_WIDTH * 0.7, W_HEIGHT * 0.7

function love.load()
  love.graphics.setDefaultFilter('nearest', 'nearest')

  Push:setupScreen(V_WIDTH, V_HEIGHT, W_WIDTH, W_HEIGHT, {resizable = true, fullscreen = false})

  GameState.registerEvents()
  GameState.switch(StartState)
end

function love.resize(width, height)
  Push:resize(width, height)
end