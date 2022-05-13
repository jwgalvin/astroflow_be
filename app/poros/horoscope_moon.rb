class HoroscopeMoon
  attr_reader :current_date,
              :description,
              :compatibility,
              :mood,
              :color,
              :lucky_number,
              :lucky_time,
              :moon,
              :moon_phase

  def initialize(horoscope_today, horoscope_yesterday, moon_today, moon_yesterday)
    #binding.pry
    @todays_date = horoscope_today[:current_date],
    @description =  horoscope_today[:description],
    @compatibility = horoscope_today[:compatibility],
    @mood = horoscope_today[:mood],
    @color = horoscope_today[:color],
    @lucky_number = horoscope_today[:lucky_number],
    @lucky_time = horoscope_today[:lucky_time],
    @moon = moon_today[0][:moon],
    @moon_phase = moon_today[0][:moon_phase],
    @prior_date = horoscope_yesterday[:current_date],
    @prior_description =  horoscope_yesterday[:description],
    @prior_compatibility = horoscope_yesterday[:compatibility],
    @prior_mood = horoscope_yesterday[:mood],
    @prior_color = horoscope_yesterday[:color],
    @prior_lucky_number = horoscope_yesterday[:lucky_number],
    @prior_lucky_time = horoscope_yesterday[:lucky_time],
    @prior_moon = moon_yesterday[0][:moon],
    @prior_moon_phase = moon_yesterday[0][:moon_phase]
  end
end
