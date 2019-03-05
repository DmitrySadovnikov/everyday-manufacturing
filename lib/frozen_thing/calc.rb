module FrozenThing
  module Calc
    module_function

    EARTH_RADIUS = 6371.23

    def distance(start_point, end_point)
      delta_lat = deg_to_rad(end_point[:lat] - start_point[:lat])
      delta_lon = deg_to_rad(end_point[:lon] - start_point[:lon])
      a = Math.sin(delta_lat / 2) *
          Math.sin(delta_lat / 2) +
          Math.cos(deg_to_rad(start_point[:lat])) *
          Math.cos(deg_to_rad(end_point[:lat])) *
          Math.sin(delta_lon / 2) * Math.sin(delta_lon / 2)
      c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
      (EARTH_RADIUS * c).round(2)
    end

    def deg_to_rad(deg)
      deg * (Math::PI / 180)
    end
  end
end
