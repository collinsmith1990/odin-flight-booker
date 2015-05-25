class FlightsController < ApplicationController

  def index
    #Flight search options
    @airport_options = Airport.airport_options
    @passenger_options = [1, 2, 3, 4]
    @date_options = Flight.date_options
    #Results
    unless params[:from_airport_id] == nil
      @flights = Flight.search_flights(params[:from_airport_id], params[:to_airport_id], params[:date])
    end
  end
end
