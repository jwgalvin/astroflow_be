require 'rails_helper'

RSpec.describe DailyFlowChart, type: :model do
  describe "relationships" do
    it { should belong_to(:user)}
  end

  describe "validations" do
    it {should validate_presence_of(:date) }
    it {should validate_presence_of(:emotions)}
    it {should validate_presence_of(:flow_status)}
  end

  it "exists" do
    user = User.create!(email: 'testing@test.com')
    daily_flow_chart = DailyFlowChart.create!(date: Date.today, bloating: true, cramps: false, emotions: 'I feel alright', flow_status: 2, user_id: user.id)

    expect(daily_flow_chart).to be_a(DailyFlowChart)
    expect(user.daily_flow_charts.first).to eq(daily_flow_chart)
  end
end
