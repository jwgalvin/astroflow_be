require 'rails_helper'

RSpec.describe "Edits a Daily Flow Chart" do
  xit "can edit a daily flow chart" do

    user = User.create!(email: "test@gmail.com")
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
          emotions: "I feel not ok",
          flow_status: 'light'
     }

    headers = {"CONTENT_TYPE" => "application/json"}

    patch "/api/v1/users/daily_flow_chart?email=#{user.email}&&date=#{Date.today}", headers: headers, params: JSON.generate(daily_flow_chart: daily_flow_chart_params)

    updated_chart = DailyFlowChart.last

    expect(updated_chart.date).to eq(daily_flow_chart_params[:date])
		expect(updated_chart.bloating).to eq(daily_flow_chart_params[:bloating])
		expect(updated_chart.cramps).to eq(daily_flow_chart_params[:cramps])
		expect(updated_chart.emotions).to eq(daily_flow_chart_params[:emotions])
		expect(updated_chart.flow_status).to eq(daily_flow_chart_params[:flow_status])
  end
end
