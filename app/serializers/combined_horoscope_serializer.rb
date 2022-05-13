class CombinedHoroscopeSerializer
  class << self
    def generate(both)
      binding.pry
      { "data":
        {
          "id": nil,
          "type": 'horoscopes',
          "attributes":
            {
              "Today":
              {
                "current_date": both.todays_date,
                "description": both.description,
                "compatibility": both.compatibility,
                "mood": both.mood,
                "color": both.color,
                "lucky_number": both.lucky_number,
                "lucky_time": both.lucky_time,
                "moon": both.moon[0],
                "moon_phase": both.moon_phase[0],
              },
            "Yesterday":
              {
                "current_date": both.prior_date,
                "description": both.prior_description,
                "compatibility": both.prior_compatibility,
                "mood": both.prior_mood,
                "color": both.prior_color,
                "lucky_number": both.prior_lucky_number,
                "lucky_time": both.prior_lucky_time,
                "moon": both.prior_moon[0],
                "moon_phase": both.prior_moon_phase[0]
              }
          }
        }
      }
    end
  end
end
