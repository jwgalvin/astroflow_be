class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :date_of_birth

end
