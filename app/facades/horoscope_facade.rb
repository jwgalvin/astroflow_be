class HoroscopeFacade
  class << self
    def get_today_horoscope_moon(zodiac_sign)
      today = Time.now.to_i
      horoscope_data = HoroscopeService.call_today_horoscope(zodiac_sign)
      moon_data = results = MoonService.get_moon(today)
      horoscope(horoscope_data, moon_data)
    end

    def get_yesterday_horoscope_moon(zodiac_sign)
      yesterday = Time.now.to_i - (60*60*24)
      horoscope_data = HoroscopeService.call_yesterday_horoscope(zodiac_sign)
      moon_data = results = MoonService.get_moon(yesterday)
      horoscope(horoscope_data, moon_data)
    end

    # def get_tomorrow_horoscope(zodiac_sign)
    #   HoroscopeService.call_tomorrow_horoscope(zodiac_sign)
    # end 

    private

    def horoscope(horoscope_data, moon_data)
      a = HoroscopeMoon.new(current_date: horoscope_data[:current_date],
                        description: horoscope_data[:description],
                        compatibility: horoscope_data[:compatibility],
                        mood: horoscope_data[:mood],
                        color: horoscope_data[:color],
                        lucky_number: horoscope_data[:lucky_number],
                        lucky_time: horoscope_data[:lucky_time],
                        moon: moon_data.first[:Moon].first,
                        moon_phase: moon_data.first[:Phase])
    end
  end
end
