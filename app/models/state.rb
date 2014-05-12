class State < ActiveRecord::Base
  establish_connection 'commondata'

  has_many :municipalities

  default_scope { includes(:municipalities) }

  def to_s
    name
  end
  
  include Aggregations
end
