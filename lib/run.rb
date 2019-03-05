require_relative 'frozen_thing'

FrozenThing::Customer.filter_by_distance.each { |c| puts "#{c.user_id} #{c.name}" }
