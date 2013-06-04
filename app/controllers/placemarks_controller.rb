class PlacemarksController < ApplicationController
  # GET /placemarks
  # GET /placemarks.json
  def index
    @placemarks = Placemark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @placemarks }
    end
  end
end
