require 'rails_helper'

RSpec.describe 'gets the moonphases' do
  it 'gets the moon phase for today', :vcr do
    get '/api/v1/moon'
    expect(response).to be_successful

    moon = JSON.parse(response.body, symbolize_names: true)

    expect(moon).to have_key(:date)
    expect(moon[:date]).to be_a(String)

    expect(moon).to have_key(:phase)
    expect(moon[:phase]).to be_a(String)
  end
end
