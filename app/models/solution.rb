class Solution < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :user
  attr_accessible :id, :exercise_id, :points, :result, :user_id, :file
  has_attached_file :file,
                  :url  => "/assets/solutions/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/solutions/:id/:style/:basename.:extension"
end
