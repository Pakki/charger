# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts('Seeding started. Wait for finishing...')
# clients start
clients = []
100.times do
  clients.push({ name: Faker::Name.name, phone_number: Faker::Base.numerify('7##########') })
end
clients = Client.create!(clients)
# clients end

# points start
points = []
30.times do
  points.push(title: Faker::Address.community, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
end
points = Point.create(points)
# points end

# stations
stations = []
points.each do |point|
  stations.push({ point_id: point.id, sn: Faker::Barcode.ean(length = 8) })
end
stations = Station.create(stations)
# stations end

# connectors
connectors = []
stations.each do |station|
  3.times do |n|
    connectors.push({ station_id: station.id, connector_type: n + 1, state: 2, power: 120 })
  end
end
connectors = Connector.create(connectors)
puts('Seeding finished')
# connectors end
