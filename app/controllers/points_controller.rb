class PointsController < ApplicationController
  
  # GET /points
  def index
    @points = Point.eager_load(stations: :connectors)
  end
end
