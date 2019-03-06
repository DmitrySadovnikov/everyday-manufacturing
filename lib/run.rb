require_relative 'frozen_thing'

begin
  FrozenThing::Customer.filter_by_distance.each { |c| puts "#{c.user_id} #{c.name}" }
rescue FrozenThing::FileNotFound, InvalidFileContent, InvalidPointError => e
  puts e
end
