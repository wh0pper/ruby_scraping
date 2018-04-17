class Week < ActiveRecord::Base
  belongs_to :course
  has_many :lessons
  validates :number, :presence => true
end
