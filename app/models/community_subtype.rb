class CommunitySubtype < ActiveRecord::Base
  establish_connection 'commondata'

  belongs_to :community_type
end
