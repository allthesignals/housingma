class CommunityType < ActiveRecord::Base
  establish_connection 'commondata'

  has_many :community_subtypes
end
