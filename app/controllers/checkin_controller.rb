class CheckinController < ApplicationController
  def index
  end

  # POST /checkin
  def create
    @checkin = Checkin.new(params[:checkin])

    respond_to do |format|
      if @checkin.save
        format.html { redirect_to @checkin, notice: 'checkin was successfully created.' }
        format.json { render json: @checkin, status: :created, location: @checkin }
      else
        format.html { render action: "new" }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

end
