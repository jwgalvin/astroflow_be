class HoroscopeFacade
  class << self
    def get_today_horoscope_moon(zodiac_sign)
      today = Time.now.to_i
      horoscope_data = HoroscopeService.call_today_horoscope(zodiac_sign)
      moon_data  = MoonService.get_moon(today)
      horoscope(horoscope_data, moon_data)
    end

    def get_yesterday_horoscope_moon(zodiac_sign)
      yesterday = Time.now.to_i - (60*60*24)
      horoscope_data = HoroscopeService.call_yesterday_horoscope(zodiac_sign)
      moon_data  = MoonService.get_moon(yesterday)
      horoscope(horoscope_data, moon_data)
    end

    def get_both_horoscopes(zodiac)
      today = Time.now.to_i
      yesterday = Time.now.to_i - (60*60*24)
      horoscope_today = HoroscopeService.call_today_horoscope(zodiac)
      horoscope_yesterday = HoroscopeService.call_today_horoscope(zodiac)
      moon_today  = MoonService.get_moon(today)
      moon_yesterday  = MoonService.get_moon(yesterday)
      the_thing = HoroscopeMoon.new(horoscope_today, horoscope_yesterday, moon_today, moon_yesterday)
      #binding.pry
    end

    private

      # a = HoroscopeMoon.new({today: {
      #                   current_date: horoscope_today[:current_date],
      #                   description: horoscope_today[:description],
      #                   compatibility: horoscope_today[:compatibility],
      #                   mood: horoscope_today[:mood],
      #                   color: horoscope_today[:color],
      #                   lucky_number: horoscope_today[:lucky_number],
      #                   lucky_time: horoscope_today[:lucky_time],
      #                   moon: moon_today.first[:Moon].first,
      #                   moon_phase: moon_today.first[:Phase]},
      #                 yesterday: {
      #                   current_date: horoscope_yesterday[:current_date],
      #                   description: horoscope_yesterday[:description],
      #                   compatibility: horoscope_yesterday[:compatibility],
      #                   mood: horoscope_yesterday[:mood],
      #                   color: horoscope_yesterday[:color],
      #                   lucky_number: horoscope_yesterday[:lucky_number],
      #                   lucky_time: horoscope_yesterday[:lucky_time],
      #                   moon: moon_yesterday.first[:Moon].first,
      #                   moon_phase: moon_yesterday.first[:Phase]
      #                   }})
      #
  end
end
