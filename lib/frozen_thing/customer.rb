require 'json'

module FrozenThing
  class Customer
    class << self
      def filter_by_distance(end_point: PARTY_POINT, min_distance: MIN_DISTANCE)
        all.select { |customer| customer.distance(end_point: end_point) <= min_distance }
      end

      def all
        file.each_line.map(&method(:parse_line)).sort_by(&:user_id)
      end

      def parse_line(line)
        return if line.strip.empty?

        json = JSON.parse(line)
        Customer.new(user_id: json['user_id'].to_i,
                     name: json['name'],
                     point: Point.new(lat: json['latitude'], lon: json['longitude']))
      rescue StandardError
        raise InvalidFileContentError, 'invalid file content'
      end

      def file
        raise FileNotFoundError, "file #{FILE_PATH} not found" unless File.exist?(FILE_PATH)

        File.read(FILE_PATH)
      end
    end

    attr_reader :user_id, :name, :point

    def initialize(user_id:, name:, point:)
      @user_id = user_id
      @name = name
      @point = point
    end

    def distance(end_point: PARTY_POINT)
      Calc.distance(point, end_point)
    end
  end
end
