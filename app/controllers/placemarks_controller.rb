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

  # GET /placemarks/1
  # GET /placemarks/1.json
  def show
    @placemark = Placemark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @placemark }
    end
  end
end
