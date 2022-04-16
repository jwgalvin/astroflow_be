class DailyFlowChart < ApplicationRecord
  belongs_to :user

  validates_presence_of :date
  validates_presence_of :emotions
  validates_presence_of :flow_status

  enum flow_status: { "light" => 0, "moderate" => 1, "heavy" => 2  }
end
