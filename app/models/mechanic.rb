class Mechanic < ActiveRecord::Base
  validates :name, uniqueness: true
end
