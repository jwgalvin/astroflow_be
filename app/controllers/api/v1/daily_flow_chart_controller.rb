class Api::V1::DailyFlowChartController < ApplicationController 
  def create 
    user = User.find_by(email: params[:email])
    render json: user.daily_flow_charts.create(flow_chart_params)
  end 

  def flow_chart_params 
    params.require(:daily_flow_chart).permit(:date, :bloating, :cramps, :emotions, :flow_status)
  end 
end 