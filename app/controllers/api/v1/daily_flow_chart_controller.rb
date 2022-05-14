class Api::V1::DailyFlowChartController < ApplicationController
  def create
    user = User.find_or_create_by(email: params[:email])
    #data = parse_data(params["daily_flow_chart"])
    create_flowchart(user, params["daily_flow_chart"])
  end

  def update
    user = User.find_by(email: params[:email])
    chart = user.daily_flow_charts.find_by(date: params[:date])
    #data = parse_data(params["daily_flow_chart"])
    update_flowchart(chart, params["daily_flow_chart"])
  end

  def index
    user = User.find_by(email: params[:email])
    render json: user.daily_flow_charts
  end

  def show
    user = User.find_by(email: params[:email])
    chart = user.daily_flow_charts.find_by(date: params[:date])
    render json: DailyFlowChartSerializer.new(chart)
  end

  private

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
