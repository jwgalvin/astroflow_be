class HoroscopeSerializer
  include JSONAPI::Serializer
  attributes :current_date, :color, :compatibility, :description, :mood, :color, :lucky_time, :lucky_number, :moon, :moon_phase 
  #binding.pry
end
