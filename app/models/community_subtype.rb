class CommunitySubtype < ActiveRecord::Base
  establish_connection 'commondata'

  belongs_to :community_type
  has_many   :municipalities

  include Aggregations
end
