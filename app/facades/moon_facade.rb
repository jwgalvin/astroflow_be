class MoonFacade
  def self.find_todays_moon
    today = Time.now.to_i
    results = MoonService.get_moon(today)
    results.map do |result|
      Moon.new(result)
    end.first
  end
end
