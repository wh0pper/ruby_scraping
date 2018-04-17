class Lesson < ActiveRecord::Base
  belongs_to :week
  # validates :number, :description :presence => true
  # lesson index 
end
