class Region < ActiveRecord::Base
  establish_connection 'commondata'
  
  has_and_belongs_to_many :municipalities

  default_scope { includes(:municipalities) }

  def to_s
    name
  end

  include Aggregations
end