-- Positionable - An Interface that all physically positioned objects share. Coordinate's an object's x, y, width, and height.

local Positionable = Class{}

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
function Positionable:canFit(positionable)
  return self.width <= positionable.width and self.height <= positionable.height
end

-- + Positionable:center() - returns the World Coordinate of the absolute center of the positionable object.
function Positionable:getCenter()
  return self.x + math.floor(self.width / 2),
         self.y + math.floor(self.height / 2)
end

-- + Positionable.isPositionable() - returns true always, used to confirm that an object is positionable
function Positionable.isPositionable()
  return true
end

return Positionable