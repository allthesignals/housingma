class CommunityType < ActiveRecord::Base
  establish_connection 'commondata'

  has_many :community_subtypes
  has_many :municipalities, through: :community_subtypes

  include Aggregations
end
