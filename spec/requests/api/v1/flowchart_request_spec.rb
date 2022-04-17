require 'rails_helper'

RSpec.describe 'Send info of a Users flowchart' do
  it 'get flowchart endpoint' do
    # user = { name: 'test', email: 'dopeboi69420@aol.com', date_of_birth: Date.today }
    flow_chart_params = { date: Date.today,
                          bloating: true,
                          cramps: false,
                          emotions: 'I feel like shit',
                          flow_status: 1 }

    headers = { 'CONTENT_TYPE' => 'application/json' }

    get '/api/v1/daily_flow_charts', headers: headers, params: JSON.generate(user: flow_chart_params)

    expect(response).to be_successful

    flowchart = JSON.parse(response.body, symbolize_names: true)

    expect(flowchart[:emotions]).to eq('I feel like shit')
  end
end
