class Region < ActiveRecord::Base
  establish_connection 'commondata'
  
  has_and_belongs_to_many :municipalities

  def to_s
    name
  end

  include Aggregations
end