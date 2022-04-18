require 'rails_helper'


RSpec.describe "Gets Yesterday, Today, Tomorrow, Horoscopes", :vcr do
  xit "gets today horoscope for a zodiac sign" do
    zodiac_name = "Leo"
    keys = [:date_range, :current_date, :description, :compatibility, :mood, :color, :lucky_number, :lucky_time]
    todays_date = Date.today.strftime("%B %d, %Y")

    get "/api/v1/horoscopes/find?sign=#{zodiac_name}"

    horoscope_result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(horoscope_result.count).to eq(8)
    expect(horoscope_result.keys).to eq(keys)
    expect(horoscope_result[:current_date]).to eq(todays_date)
  end

  xit "gets tommorows horoscope for a zodiac sign" do
    zodiac_name = "Leo"
    day = "tomorrow"
    keys = [:date_range, :current_date, :description, :compatibility, :mood, :color, :lucky_number, :lucky_time]
    tomorrows_date = Date.tomorrow.strftime("%B %d, %Y")

    get "/api/v1/horoscopes/find?sign=#{zodiac_name}&day=#{day}"

    horoscope_result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(horoscope_result.count).to eq(8)
    expect(horoscope_result.keys).to eq(keys)
    expect(horoscope_result[:current_date]).to eq(tomorrows_date)
  end

  xit "gets yesterdays horoscope for a zodiac sign" do

    zodiac_name = "Leo"
    day = "yesterday"
    keys = [:date_range, :current_date, :description, :compatibility, :mood, :color, :lucky_number, :lucky_time]
    yesterdays_date = Date.yesterday.strftime("%B %d, %Y")

    get "/api/v1/horoscopes/find?sign=#{zodiac_name}&day=#{day}"

    horoscope_result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(horoscope_result.count).to eq(8)
    expect(horoscope_result.keys).to eq(keys)
    expect(horoscope_result[:current_date]).to eq(yesterdays_date)
  end

  it "gets todays and yesterdays horoscope and moon" do  
    zodiac_name = "Leo"
    keys = [:current_date, :description, :compatibility, :mood, :color, :lucky_number, :lucky_time, :moon, :moon_phase]
    

    get "/api/v1/horoscopes/find?sign=#{zodiac_name}"
    
    horoscope_result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(horoscope_result.count).to eq(2)
    expect(horoscope_result[:today_horoscope].keys.count).to eq(keys.count)
    expect(horoscope_result[:today_horoscope].keys).to eq(keys)
  end 
end
