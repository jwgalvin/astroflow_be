class Api::V1::DailyFlowChartController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    data = parse_data(params["daily_flow_chart"])
    create_flowchart(user, data)
  end

  def update
    
    user = User.find_by(email: params[:email])
    chart = user.daily_flow_charts.find_by(date: params[:date])
    data = parse_data(params["daily_flow_chart"])
    update_flowchart(chart, data)
  end

  def index
    user = User.find_by(email: params[:email])
    chart = user.daily_flow_charts.find_by(date: params[:date])
    render json: DailyFlowChartSerializer.new(chart)
  end

  private 

  

  def parse_data(data)
    JSON.parse(data, symbolize_names: true)
  end 

  def create_flowchart(user, flow_chart) 
    user.daily_flow_charts.create(date: flow_chart[:date], bloating: flow_chart[:bloating], 
                                  cramps: flow_chart[:cramps], emotions: flow_chart[:emotions], 
                                  flow_status: flow_chart[:flow_status])
  end 

  def update_flowchart(chart, flow_chart) 
    chart.update(date: flow_chart[:date], bloating: flow_chart[:bloating], 
                cramps: flow_chart[:cramps], emotions: flow_chart[:emotions], 
                flow_status: flow_chart[:flow_status])
  end 
end
