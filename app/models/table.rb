class Table < ActiveRecord::Base
  validates_presence_of :number
  validates_uniqueness_of :number
end
