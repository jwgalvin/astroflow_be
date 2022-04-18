class MoonService
  def self.get_moon(date)
    response = Faraday.get("http://api.farmsense.net/v1/moonphases/?d=#{date}")
    JSON.parse(response.body, symbolize_names: true)
  end
end
