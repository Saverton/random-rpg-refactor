local CameraDependent = Class{}

function CameraDependent:init(h_range, v_range)
  assert(self.isPositionable, 'Camera Dependent must implement the Positionable Interface.')

  self.h_range, self.v_range = h_range, v_range

  self.range_obj = {
    min_x = 0,
    min_y = 0,
    max_x = self.h_range,
    max_y = self.v_range
  }
end

-- + CameraDependent:updateDependency(CameraManager: camera) - updates the range_obj to contain the new min_x and min_y values based on camera position
function CameraDependent:updateDependency(camera)
  local cam_x, cam_y = camera.camera:position()
  self.range_obj = {
    min_x = math.max(0, cam_x - self.h_range),
    min_y = math.max(0, cam_y - self.v_range),
    max_x = math.min(self.width, cam_x + self.h_range),
    max_y = math.min(self.height, cam_y + self.v_range)
  }
end

-- + CameraDependent:getDependency(number: divisor) - returns a modified range object with each unit divided by a given divisor (or 1)
function CameraDependent:getDependency(divisor)
  divisor = divisor or 1

  return {
    min_x = math.floor(self.range_obj.min_x / divisor),
    min_y = math.floor(self.range_obj.min_y / divisor),
    max_x = math.ceil(self.range_obj.max_x / divisor),
    max_y = math.ceil(self.range_obj.max_y / divisor)
  }
end

-- + CameraDependent.isCameraDependent() - always returns true, used to determine if an object implements this interface

return CameraDependent