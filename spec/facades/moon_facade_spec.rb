require 'rails_helper'
RSpec.describe MoonFacade do
  it 'returns an array of moon phases for the month', :vcr do
    moon_phases = MoonFacade.find_moon_phases('April')
    expect(moon_phases).to be_an(Array)
    moon_phases.each do |m|
      expect(m).to be_a(Moon)
    end
  end
end
