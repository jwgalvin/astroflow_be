require 'rails_helper'
RSpec.describe MoonFacade do
  it 'returns a moon phases for a specific date', :vcr do
    moon = MoonFacade.find_todays_moon
    expect(moon).to be_a(Moon)
    expect(moon.date).to eq(Time.now.to_i.to_s)
  end
end
