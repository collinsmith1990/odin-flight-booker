class Airport < ActiveRecord::Base
  has_many :departing_flights, class_name: "Flight", foreign_key: "from_airport_id"
  has_many :arriving_flights, class_name: "Flight", foreign_key: "to_airport_id"

  def self.airport_options
    Airport.all.map { |a| [a.airport_code, a.id] }
  end
end
