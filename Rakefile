file 'GeoIP.dat.gz' do
  sh "wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz"
end

file "GeoIP.dat" => "GeoIP.dat.gz" do
  sh "gunzip -c GeoIP.dat.gz > GeoIP.dat"
end

task default: "GeoIP.dat"
