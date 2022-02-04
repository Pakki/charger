json.extract! station, :id, :sn
json.connectors station.connectors, partial: 'connector', as: :connector
