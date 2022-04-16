class Note < ApplicationRecord
  belongs_to :user

  validates_presence_of :date
  validates_presence_of :message
  validates_presence_of :user_id
end
