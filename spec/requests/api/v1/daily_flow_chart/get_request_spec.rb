require 'rails_helper'

RSpec.describe 'Send info of a Users flowchart' do
  it 'get flowchart endpoint' do
    user = User.create!(name: 'test', date_of_birth: Date.today, email: 'test@gmail.com')
    daily_flow_chart = DailyFlowChart.create!(date: Date.today,
                                              bloating: false,
                                              cramps: true,
                                              emotions: 'I feel bad',
                                              flow_status: 2,
                                              user_id: user.id)

    get "/api/v1/users/daily_flow_chart?email=#{user.email}&&date=#{Date.today}"

    expect(response).to be_successful

    flowchart = JSON.parse(response.body, symbolize_names: true)

    expect(flowchart[:bloating]).to eq(daily_flow_chart[:bloating])
    expect(flowchart[:cramps]).to eq(daily_flow_chart[:cramps])
    expect(flowchart[:emotions]).to eq(daily_flow_chart[:emotions])
    expect(flowchart[:flow_status]).to eq(daily_flow_chart[:flow_status])
  end
end
