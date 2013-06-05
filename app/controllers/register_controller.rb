require 'oauth2'

#FOURSQ_CLIENT_ID = 'GBCU0L2D1WW0PYLSX4EMZSGJ0ZRV21FKNGUCD3SIXHDKKOZN'
#FOURSQ_CLIENT_SECRET = 'HGSLEOP322JIMKTKHZZGI243D5YYQL5ED5MY0O5IJNWSTO24'
#FOURSQ_PUSH_SECRET = 'AEDZX2JPWMVJR0ZREHEUGYGRDZS4ICM0WC0UX2E4IKAIKR0R'
#TEST
FOURSQ_CLIENT_ID = 'YWTUTS3OL0HWSULMMURGHIU51QDQ4LS5RLGXJDGV3NENV1JE'
FOURSQ_CLIENT_SECRET = 'RXXELPAKSE4AXYADZIRHFHC5HIK4OIP5A115H1VHV0OLANCE'
FOURSQ_PUSH_SECRET = 'XVTHZ2DZHCR2K5PZ3UBVQXBQUABKH3YO3BE5QUF4TEGHKTB5'

class RegisterController < ApplicationController
  def create
    redirect_uri = "https://mike.tig.as/nypl-hack/register_callback"

    uri = URI.parse("https://foursquare.com/oauth2/access_token?client_id=#{FOURSQ_CLIENT_ID}&client_secret=#{FOURSQ_CLIENT_SECRET}&grant_type=authorization_code&redirect_uri=#{redirect_uri}&code=" + params[:code])
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)
    response = JSON.parse(http.request(request).body)
    access_token = OAuth2::AccessToken.new(client, response["access_token"])
    str_token = response['access_token']
    #puts access_token

    user = access_token.get('https://api.foursquare.com/v2/users/self')
    puts user.inspect
    puts user.id

    Accesstoken.create(:access_token => str_token, :user_id => user.id)

    respond_to do |format|
      format.html { render text: "Yay!\n#{str_token}" }
    end
  end
end
