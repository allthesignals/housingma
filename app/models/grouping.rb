class Grouping < ActiveRecord::Base
  self.abstract_class = true
  attr_accessible :narrative, :sort_order, :title
end
