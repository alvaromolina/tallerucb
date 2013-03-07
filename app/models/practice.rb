class Practice < ActiveRecord::Base
  attr_accessible :name, :exercises_attributes, :number, :due_date, :due_date_string
  has_many :exercises, :dependent => :destroy
  accepts_nested_attributes_for :exercises, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  def due_date_string
    due_date.to_s()
  end
  
  def due_date_string=(due_date_str)
    self.due_date = Time.parse(due_date_str)
  rescue ArgumentError
    @due_date_invalid = true
  end
  
  def validate
    errors.add(:due_date, "is invalid") if @due_date_invalid
  end
end
