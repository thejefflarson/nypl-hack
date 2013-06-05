require 'oauth2'

#FOURSQ_CLIENT_ID = 'GBCU0L2D1WW0PYLSX4EMZSGJ0ZRV21FKNGUCD3SIXHDKKOZN'
#FOURSQ_CLIENT_SECRET = 'HGSLEOP322JIMKTKHZZGI243D5YYQL5ED5MY0O5IJNWSTO24'
#FOURSQ_PUSH_SECRET = 'AEDZX2JPWMVJR0ZREHEUGYGRDZS4ICM0WC0UX2E4IKAIKR0R'
#TEST
FOURSQ_CLIENT_ID = 'YWTUTS3OL0HWSULMMURGHIU51QDQ4LS5RLGXJDGV3NENV1JE'
FOURSQ_CLIENT_SECRET = 'RXXELPAKSE4AXYADZIRHFHC5HIK4OIP5A115H1VHV0OLANCE'
FOURSQ_PUSH_SECRET = 'XVTHZ2DZHCR2K5PZ3UBVQXBQUABKH3YO3BE5QUF4TEGHKTB5'

#
class RegisterController < ApplicationController
  def create
    code = params['CODE']

    begin
        client = OAuth2::Client.new(
          FOURSQ_CLIENT_ID, FOURSQ_CLIENT_SECRET,
          :authorize_url => "/oauth2/authorize",
          :token_url => "/oauth2/access_token",
          :authorize_path     => "/oauth2/authenticate?response_type=code",
          :site => "https://foursquare.com/",
            :parse_json => true
        )

        token = client.auth_code.get_token(code, :redirect_uri => "https://mike.tig.as/nypl-hack/register_callback")
    rescue
        raise
        #token = nil
    end
    puts token

    respond_to do |format|
      format.html { render text: "Yay!\n#{token}" }
    end
  end
end
