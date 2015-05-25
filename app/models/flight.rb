class Flight < ActiveRecord::Base
  belongs_to :from_airport, class_name: "Airport"
  belongs_to :to_airport, class_name: "Airport"

  def self.all_flight_times
    Flight.select(:start_time).where("start_time > :now", { now: Time.now.utc }).order(start_time: :asc)
  end

  def self.date_options
    Flight.all_flight_times.map { |f| f.start_time.utc.strftime('%d/%m/%Y') }.uniq
  end

  def self.search_flights(from_id, to_id, date)
    date = Date.parse(date)
    Flight.where(from_airport_id: from_id, to_airport_id: to_id, start_time: date.beginning_of_day..date.end_of_day)
  end
end
