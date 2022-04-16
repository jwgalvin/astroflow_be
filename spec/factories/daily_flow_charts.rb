FactoryBot.define do
  factory :daily_flow_chart do
    user
    date { "2022-04-16" }
    bloating { true }
    cramps { true }
    emotions { "MyText" }
    flow_status { 1 }
  end
end
