module AirMonitor
  class Stations
    def self.all
      @stations ||= JSON.parse(HTTParty.get('https://air-monitor.pl/api/v1/stations', format: 'json').body)
    end
  end
end
