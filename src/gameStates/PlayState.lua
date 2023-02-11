-- Play State: The main game state when playing the game. Displays the player, the world, and any player UI visible in the world.

local PlayState = Class{}
local scene

function PlayState:enter()
  scene = Scene()
end

function PlayState:update(dt)
  scene:update(dt)
end

function PlayState:draw()
  Push:start()
  scene:render()
  Push:finish()
end

-- Return to start state on 'esc'
function PlayState:keypressed(key, _)
  if key == 'escape' then
    GameState.switch(StartState)
  end
end

return PlayState