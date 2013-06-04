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

  # GET /placemarks/new
  # GET /placemarks/new.json
  def new
    @placemark = Placemark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @placemark }
    end
  end

  # GET /placemarks/1/edit
  def edit
    @placemark = Placemark.find(params[:id])
  end

  # POST /placemarks
  # POST /placemarks.json
  def create
    @placemark = Placemark.new(params[:placemark])

    respond_to do |format|
      if @placemark.save
        format.html { redirect_to @placemark, notice: 'Placemark was successfully created.' }
        format.json { render json: @placemark, status: :created, location: @placemark }
      else
        format.html { render action: "new" }
        format.json { render json: @placemark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /placemarks/1
  # PUT /placemarks/1.json
  def update
    @placemark = Placemark.find(params[:id])

    respond_to do |format|
      if @placemark.update_attributes(params[:placemark])
        format.html { redirect_to @placemark, notice: 'Placemark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @placemark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /placemarks/1
  # DELETE /placemarks/1.json
  def destroy
    @placemark = Placemark.find(params[:id])
    @placemark.destroy

    respond_to do |format|
      format.html { redirect_to placemarks_url }
      format.json { head :no_content }
    end
  end
end
