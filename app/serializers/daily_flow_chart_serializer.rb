class DailyFlowChartSerializer 
  include JSONAPI::Serializer
  attributes :date, :bloating, :cramps, :emotions, :flow_status
end 