class HoroscopeFacade 
  class << self 
    def get_today_horoscope(zodiac_sign)
      HoroscopeService.call_today_horoscope(zodiac_sign)
    end 

    def get_tomorrow_horoscope(zodiac_sign)
      HoroscopeService.call_tomorrow_horoscope(zodiac_sign)
    end 

    def get_yesterday_horoscope(zodiac_sign)
      HoroscopeService.call_yesterday_horoscope(zodiac_sign)
    end 
  end 
end 