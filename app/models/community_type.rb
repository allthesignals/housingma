class CommunityType < ActiveRecord::Base
  establish_connection 'commondata'

  has_many :community_subtypes
  has_many :municipalities, through: :community_subtypes

  def muni_names
    municipalities.map{|m| m.name}
  end

  def to_s
    name
  end

  include Aggregations
end
