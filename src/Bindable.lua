-- Bindable: an interface for binding positional objects within the dimensions of another positional object.

local Bindable = Class{}

local min, max = math.min, math.max

-- + Bindable:init(bounding_object) - creates a new bindable object, and defines it's bounding_object
-- TODO: assert that bounding_object is larger than self
function Bindable:init(bounding_object)
  assert(self:canFit(bounding_object), 'Bounding object must be larger (in terms of length and width) than bindable')
  self.bounding = bounding_object
end

-- + Bindable:bind() - resets the bound object to be within the binding object if it has escaped
function Bindable:bind()
  self.x = max(self.x, self.bounding.x) -- left
  self.y = max(self.y, self.bounding.y) -- top
  self.x = min(self.x, self.bounding.x + self.bounding.width - self.width) -- right
  self.y = min(self.y, self.bounding.y + self.bounding.height - self.height) -- bottom
end

return Bindable