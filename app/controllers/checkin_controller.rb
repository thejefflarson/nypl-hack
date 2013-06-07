class CheckinController < ApplicationController
  # POST /checkin
  def create
    obj = params[:checkin]
    json = JSON.parse(obj)

    id = json["id"]
    user_id = json["user"]["id"]
    lat = json["venue"]["location"]["lat"]
    lng = json["venue"]["location"]["lng"]
    placemark_url = placemarks_url :q => "#{lng},#{lat}"

    #lat_f = lat.to_f
    #lng_f = lng.to_f
    #if (((lat_f >= 40.55) && (lng_f >= -74.05) && (lat_f <= 40.94) && (lng_f  <= -73.679691)) ||# all but staten isl
    #   ((lat_f >= 40.5) && (lng_f >= -74.25) && (lat_f <= 40.65) && (lng_f  <= -74.05)))# staten isl
    begin
      query = ActiveRecord::Base.send(:sanitize_sql_array, [
        "SELECT ST_Contains(shape,ST_SetSRID(ST_MakePoint(%f, %f), 4269)) FROM \"boundaries\" WHERE slug='new-york-city'",
        lng.to_f,
        lat.to_f
      ])
      result = Authtoken.connection.exec_query(query)
      latlon_in_nyc = (result.rows[0][0] == 't')
    rescue
      latlon_in_nyc = false
    end
    if latlon_in_nyc
      access = Authtoken.where(:user_id => user_id).order("created_at DESC").first
      if !access.nil?
        Thread.new do
          str_token = access.access_token

          #puts obj
          #puts "#{id}, #{lat}, #{lng}"
          #puts placemark_url

          reply_url = URI("https://api.foursquare.com/v2/checkins/#{id}/reply")
          http = Net::HTTP.new(reply_url.host, reply_url.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE

          body_data = URI.encode_www_form(
            "url" => placemark_url,
            "CHECKIN_ID" => id,
            "text" => "See historical photos of nearby buildings from #{Placemark.gimme_photos(lat, lng).map(&:year).uniq.sort.to_sentence}.",
            "oauth_token" => str_token,
            "v" => 20130605
          )

          #puts body_data

          request = Net::HTTP::Post.new(reply_url.request_uri)
          request['Content-Type'] = "application/x-www-form-urlencoded"
          response = http.request(request, body_data)
          #puts response.body
        end
      end
    end

    respond_to do |format|
      format.html { render text: "okay" }
      format.json { render json: json }
    end
  end
end
