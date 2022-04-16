require 'rails_helper'
RSpec.describe 'moon service', :vcr do
  it 'gets details of the moon based on the month' do
    response = MoonService.get_todays_moon('1648771200')
    response.each do |moon|
      expect(moon).to have_key(:TargetDate)
      expect(moon).to have_key(:Phase)
    end
  end
end
