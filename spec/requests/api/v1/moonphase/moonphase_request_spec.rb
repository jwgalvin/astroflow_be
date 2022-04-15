require 'rails_helper'

RSpec.describe 'gets the moonphases' do
  xit 'gets the moon phase for the month ' do
    month = 'April'
    get "/api/v1/moonphases/month?=#{month}"
    expect(response).to be_successful
  end
end
