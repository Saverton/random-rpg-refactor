-- Start State: Start menu game state, displays the game title (Random RPG Refactor) with an option to press 'Enter' to begin a new game.
-- It needs to :
-- * Display Title
-- * Start on 'enter'

local StartState = Class{}

function StartState:draw()
  Push:start()
  love.graphics.printf('Random RPG Refactor', 0, 50, V_WIDTH, 'center')

  love.graphics.printf('Press \'enter\' to begin', 0, 100, V_WIDTH, 'center')
  Push:finish()
end

function StartState:keypressed(key, _)
  if key == 'return' or key == 'enter' then
    GameState.switch(PlayState)
  elseif key == 'escape' then
    love.event.quit()
  end
end

return StartState