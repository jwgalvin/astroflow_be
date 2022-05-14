class HoroscopeSerializer
  include JSONAPI::Serializer
  set_id :current_date
  attributes :current_date, :color, :compatibility, :description, :mood, :color, :lucky_time, :lucky_number, :moon, :moon_phase
end
