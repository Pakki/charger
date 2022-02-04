json.extract! point, :id, :title, :latitude, :longitude
json.stations point.stations, partial: 'station', as: :station
