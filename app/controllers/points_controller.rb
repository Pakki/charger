class PointsController < ApplicationController
  
  # GET /points
  def index
    @points = Point.all
  end
end
