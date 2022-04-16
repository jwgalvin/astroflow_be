class Api::V1::HoroscopesController < ApplicationController
  def index 
    zodiac_name = params[:sign]
    if params[:day] == "today"
      render json: HoroscopeFacade.get_today_horoscope(zodiac_name)
    elsif params[:day] == "tomorrow"
      render json: HoroscopeFacade.get_tomorrow_horoscope(zodiac_name)
    elsif params[:day] == "yesterday"
      render json: HoroscopeFacade.get_yesterday_horoscope(zodiac_name)
    end 
  end 
end 