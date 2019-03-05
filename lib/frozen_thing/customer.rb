require 'json'

module FrozenThing
  class Customer
    class << self
      def filter_by_distance(end_point: PARTY_POINT, min_distance: MIN_DISTANCE)
        all.select { |customer| customer.distance(end_point: end_point) <= min_distance }
      end

      def all
        file = File.read('customers.txt')
        result = file.each_line.map do |line|
          next if line.strip.empty?

          json = JSON.parse(line)
          Customer.new(
            user_id: json['user_id'].to_i,
            name: json['name'],
            lat: json['latitude'].to_f,
            lon: json['longitude'].to_f
          )
        end

        result.sort_by(&:user_id)
      end
    end

    attr_reader :user_id, :name, :lon, :lat

    def initialize(user_id:, name:, lat:, lon:)
      @user_id = user_id
      @name = name
      @lat = lat
      @lon = lon
    end

    def point
      {
        lat: lat,
        lon: lon
      }
    end

    def distance(end_point: PARTY_POINT)
      Calc.distance(point, end_point)
    end
  end
end
