class Api::V1::MoonController < ApplicationController
  def index
    render json: MoonFacade.find_todays_moon
  end
end
