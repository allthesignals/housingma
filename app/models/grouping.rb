class Grouping < ActiveRecord::Base
  self.abstract_class = true
  attr_accessible :narrative, :sort_order, :title

  validates :title,     presence:    true, length: { minimum: 3, maximum: 140 }
  validates :narrative, allow_blank: true, length: { minimum: 3, maximum: 8000 }

  default_scope { order(:sort_order).order(:id) }
end
