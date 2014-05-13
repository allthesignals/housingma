class State < ActiveRecord::Base
  establish_connection 'commondata'

  has_many :municipalities
  has_many :housing_data,      through: :municipalities

  default_scope { includes(:municipalities).includes(:housing_data) }

  def to_s
    name
  end
  
  include Aggregations
end
