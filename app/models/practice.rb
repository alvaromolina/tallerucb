class Practice < ActiveRecord::Base
  attr_accessible :name, :exercises_attributes, :number
  has_many :exercises, :dependent => :destroy
  accepts_nested_attributes_for :exercises, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
