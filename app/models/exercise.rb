class Exercise < ActiveRecord::Base
  attr_accessible :practice_id, :content, :name , :number
  belongs_to :practice
  has_many :solutions, :dependent => :destroy

end
