class DailyFlowChart < ApplicationRecord
  belongs_to :user

  validates_presence_of :date
  validates_presence_of :emotions
  validates_presence_of :flow_status

  enum flow_status: { "Light" => 0, "Moderate" => 1, "Heavy" => 2  }
end
