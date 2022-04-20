class Api::V1::DailyFlowChartController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    user.daily_flow_charts.create(flow_chart_params)
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
    render json: DailyFlowChartSerializer.new(chart)
  end

  private 

  def flow_chart_params
    params.permit(:date, :bloating, :cramps, :emotions, :flow_status)
  end

end
#http://localhost:5000/api/v1/users/daily_flow_chart?email=#{@user_email}  