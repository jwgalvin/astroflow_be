class Api::V1::HoroscopesController < ApplicationController
  def index
    zodiac_name = params[:sign]
    horoscopes = HoroscopeFacade.get_both_horoscopes(zodiac_name)
    render json: CombinedHoroscopeSerializer.generate(horoscopes)
  end
end
