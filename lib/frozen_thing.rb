require 'rubygems'
require 'bundler/setup'
require_relative 'frozen_thing/customer'
require_relative 'frozen_thing/point'
require_relative 'frozen_thing/calc'

module FrozenThing
  class FileNotFoundError < StandardError; end
  class InvalidFileContentError < StandardError; end
  class InvalidPointError < StandardError; end

  FILE_PATH = 'customers.txt'.freeze
  MIN_DISTANCE = 100
  PARTY_POINT = Point.new(lat: 53.1489345, lon: -6.8422408).freeze
end
