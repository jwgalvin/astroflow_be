require 'rails_helper'

RSpec.describe 'Send info of a Users flowchart' do
  it 'get flowchart endpoint' do
    user = User.create!(email: 'test@gmail.com')
    daily_flow_chart = DailyFlowChart.create!(date: Date.today,
                                              bloating: false,
                                              cramps: true,
                                              emotions: 'I feel bad',
                                              flow_status: 2,
                                              user_id: user.id)

    get "/api/v1/users/daily_flow_chart?email=#{user.email}&&date=#{Date.today}"

    expect(response).to be_successful

    flowchart = JSON.parse(response.body, symbolize_names: true)
    expect(flowchart[:data][:attributes][:bloating]).to eq(daily_flow_chart[:bloating])
    expect(flowchart[:data][:attributes][:cramps]).to eq(daily_flow_chart[:cramps])
    expect(flowchart[:data][:attributes][:emotions]).to eq(daily_flow_chart[:emotions])
    expect(flowchart[:data][:attributes][:flow_status]).to eq(daily_flow_chart[:flow_status])
  end

  it "can send all flow charts" do
    user = User.create!(email: 'test@gmail.com')
    daily_flow_chart = DailyFlowChart.create!(date: Date.today, bloating: false, cramps: true, emotions: 'I feel bad', flow_status: 1, user_id: user.id)
    daily_flow_chart_2 = DailyFlowChart.create!(date: Date.today, bloating: true, cramps: false, emotions: 'I feel alright', flow_status: 2, user_id: user.id)
    daily_flow_chart_3 = DailyFlowChart.create!(date: Date.today, bloating: false, cramps: false, emotions: 'I feel good', flow_status: 2, user_id: user.id)

    get "/api/v1/users/daily_flow_chart/all?email=#{user.email}"

    expect(response).to be_successful

    flowcharts = JSON.parse(response.body, symbolize_names: true)

    expect(flowcharts.count).to eq(3)
  end
end
