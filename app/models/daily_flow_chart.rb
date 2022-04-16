class DailyFlowChart < ApplicationRecord
  belongs_to :user

  validates_presence_of :date
  validates_presence_of :bloating
  validates_presence_of :cramps
  validates_presence_of :emotions
  validates_presence_of :flow_status
end
