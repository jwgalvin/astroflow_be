class Api::V1::DailyFlowChartController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    render json: user.daily_flow_charts.create(flow_chart_params)
  end

  def update
    user = User.find_by(email: params[:email])
    chart = user.daily_flow_charts.find_by(date: params[:date])
    chart.update(flow_chart_params)
    render json: DailyFlowChartSerializer.new(chart)
  end

  def index
    user = User.find_by(email: params[:email])
    chart = user.daily_flow_charts.find_by(date: params[:date])
    render json: chart
  end

  def flow_chart_params
    params.require(:daily_flow_chart).permit(:date, :bloating, :cramps, :emotions, :flow_status)
  end
end
