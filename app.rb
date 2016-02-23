require 'sinatra'
require 'sinatra/json'
require 'geoip'

GEODB = File.expand_path('../GeoIP.dat', __FILE__)

class CountryCodeOf
  ALLOWED_COUNTRY_CODES = %w(
    AU
    GB
    IE
    NZ
    US
  )

  FALLBACK_COUNTRY_CODE = 'AU'

  def initialize(ip)
    @ip = ip
  end

  def call
    if ALLOWED_COUNTRY_CODES.include?(code_from_ip)
      code_from_ip
    else
      FALLBACK_COUNTRY_CODE
    end
  end

  private def code_from_ip
    @code_from_ip ||= GeoIP.new(GEODB).country(@ip).country_code2
  end
end

class CountryApp < Sinatra::Base
  get '/country' do
    json countryCode: CountryCodeOf.new(request.ip).call
  end
end
