module FrozenThing
  class Point
    attr_accessor :lon, :lat

    def initialize(lat:, lon:)
      @lat = lat.to_f
      @lon = lon.to_f
    end
  end
end
