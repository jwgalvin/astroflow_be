class Api::V1::HoroscopesController < ApplicationController
  def index 
    zodiac_name = params[:sign]
    render json: { today_horoscope: HoroscopeFacade.get_today_horoscope_moon(zodiac_name), 
                   yesterday_horoscope: HoroscopeFacade.get_yesterday_horoscope_moon(zodiac_name)
    }
  end 
end 