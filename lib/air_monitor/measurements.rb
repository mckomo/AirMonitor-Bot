module AirMonitor
  class Measurements
    def self.latest(station_code)
      JSON.parse(HTTParty.get("https://air-monitor.pl/api/v1/channels/#{station_code}-PM10/measurements", format: 'json').body).first
    end
  end
end
