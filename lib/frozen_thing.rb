require 'rubygems'
require 'bundler/setup'
require_relative 'frozen_thing/customer'
require_relative 'frozen_thing/calc'

module FrozenThing
  MIN_DISTANCE = 100
  PARTY_POINT = {
    lat: 53.1489345,
    lon: -6.8422408
  }.freeze
end
