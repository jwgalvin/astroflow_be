class User < ApplicationRecord
  has_many :notes
  
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :date_of_birth

end
