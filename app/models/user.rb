class User < ApplicationRecord
  has_many :notes
  has_many :daily_flow_charts

  validates_presence_of :email
end
