Airport.delete_all
Flight.delete_all

airport1 = Airport.create(airport_code: "SFO")
airport2 = Airport.create(airport_code: "NYC")
airport3 = Airport.create(airport_code: "DEN")
airport4 = Airport.create(airport_code: "MIA")

Flight.create(from_airport_id: airport1.id, to_airport_id: airport2.id, start_time: DateTime.new(2015, 9, 13, 12), duration: 18000)
Flight.create(from_airport_id: airport2.id, to_airport_id: airport1.id, start_time: DateTime.new(2015, 9, 13, 12), duration: 18000)
Flight.create(from_airport_id: airport3.id, to_airport_id: airport4.id, start_time: DateTime.new(2015, 8, 23, 14), duration: 18000)
Flight.create(from_airport_id: airport4.id, to_airport_id: airport3.id, start_time: DateTime.new(2015, 8, 24, 14), duration: 18000)
