class Municipality < ActiveRecord::Base
  establish_connection 'commondata'

  attr_accessible :name, :muni_id, :geom

  belongs_to              :community_subtype
  has_and_belongs_to_many :subregions

  GEOFACTORY = RGeo::Geographic.spherical_factory(srid: 4326)
  set_rgeo_factory_for_column(:geom, GEOFACTORY)

  def community_type
    community_subtype.community_type unless community_subtype.nil?
  end

  def subregion_name
    subregions.pluck(:name).first || nil
  end

end
