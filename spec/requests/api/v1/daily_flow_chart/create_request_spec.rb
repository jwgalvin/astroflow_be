require 'rails_helper'

RSpec.describe "Creates a Daily Flow Chart" do
  xit "creates a daily flow chart" do

    user = User.create!(email: "test@gmail.com")
    user2 = User.create!(email: "test2@email.com")
    daily_flow_chart = DailyFlowChart.create!(date: Date.today,
                                              bloating: false,
                                              cramps: true,
                                              emotions: "I feel bad",
                                              flow_status: 2,
                                              user_id: user.id)

    daily_flow_chart_params = {
          date: Date.today,
          bloating: true,
          cramps: false,
          emotions: "I feel ok",
          flow_status: "moderate"
     }

    headers = {"CONTENT_TYPE" => "application/json"}

    post "/api/v1/users/daily_flow_chart?email=#{user2.email}", headers: headers, params: JSON.generate(daily_flow_chart: daily_flow_chart_params)

    created_chart = DailyFlowChart.last

    expect(created_chart.date).to eq(daily_flow_chart_params[:date])
		expect(created_chart.bloating).to eq(daily_flow_chart_params[:bloating])
		expect(created_chart.cramps).to eq(daily_flow_chart_params[:cramps])
		expect(created_chart.emotions).to eq(daily_flow_chart_params[:emotions])
		expect(created_chart.flow_status).to eq(daily_flow_chart_params[:flow_status])
  end
end
