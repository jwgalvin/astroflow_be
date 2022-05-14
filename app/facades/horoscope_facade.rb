class HoroscopeFacade
  class << self

    def get_both_horoscopes(zodiac)
      today = Time.now.to_i
      yesterday = Time.now.to_i - (60*60*24)
      horoscope_today = HoroscopeService.call_today_horoscope(zodiac)
      horoscope_yesterday = HoroscopeService.call_today_horoscope(zodiac)
      moon_today  = MoonService.get_moon(today)
      moon_yesterday  = MoonService.get_moon(yesterday)
      the_thing = HoroscopeMoon.new(horoscope_today, horoscope_yesterday, moon_today, moon_yesterday)
    end

  end
end
