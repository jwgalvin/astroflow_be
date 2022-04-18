require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:daily_flow_charts) }
    it { should have_many(:notes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end
end
