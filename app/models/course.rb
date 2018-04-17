class Course < ActiveRecord::Base
  has_many :weeks
  validates :name, :presence => true
  validates :name, uniqueness: true
end
