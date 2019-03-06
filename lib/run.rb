require_relative 'frozen_thing'

module FrozenThing
  begin
    Customer.filter_by_distance.each { |c| puts "#{c.user_id} #{c.name}" }
  rescue FileNotFoundError, InvalidFileContentError, InvalidPointError => e
    puts e
  end
end
