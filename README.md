# GeoIP server

A really simple GeoIP server to tell the country of the request.

    $ docker-compose up

    $ host=$(dinghy ip)
    $ port=$(docker port geoipserver_app_1 8080 | cut -f 2- -d:)
    $ curl -s "http://${host}:${port}/country" | jq .
    {
      "countryCode": "AU"
    }
