require 'rails_helper'
RSpec.describe Moon do
  it 'is initialized with a hash of data' do
    result = { TargetDate: '1648771200',
               Phase: 'Dark Moon' }
    moon = Moon.new(result)
    expect(moon.date).to eq(result[:TargetDate])
    expect(moon.phase).to eq(result[:Phase])
  end
end
