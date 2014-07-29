class LocationsController < ApplicationController
  has_many  :assignments

  def index
    @locations = Location.order(:name)
  end

end