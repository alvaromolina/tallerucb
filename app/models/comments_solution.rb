class CommentsSolution < ActiveRecord::Base
  attr_accessible :comment, :solution_id
  belongs_to :solution
end
