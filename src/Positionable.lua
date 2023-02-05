-- Positionable - An Interface that all physically positioned objects share. Coordinate's an object's x, y, width, and height.

Positionable = Class{}

-- + Positionable:init(x, y, width, height) - creates a new Positionable object
function Positionable:init(x, y, width, height)
  self.x, self.y = x, y
  self.width, self.height = width, height
end

-- + Positionable:collides_with(positionable) - returns true/false if the positionable is colliding with another positionable object
-- TODO: implement
function Positionable:collides_with(positionable)
  return (
    false
  )
end

-- + Positionable:can_fit(positionable) - returns true/false if length and width are less than or equal to (<=) than the compared positonable
function Positionable:can_fit(positionable)
  return self.width <= positionable.width and self.height <= positionable.height
end