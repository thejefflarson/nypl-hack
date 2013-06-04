class CheckinController < ApplicationController
  # POST /checkin
  def create
    obj = params
    p obj
    respond_to do |format| 
      format.json { render json: obj }
    end
  end
end