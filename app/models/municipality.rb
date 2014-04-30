class Municipality < ActiveRecord::Base
  establish_connection 'commondata'

  attr_accessible :name, :muni_id, :geom

  
  has_one :housing_data, foreign_key: 'muni_id'
  
  belongs_to :community_subtype
  belongs_to :county
  
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :subregions

  # Prevent :geom from being selected
  #   call Municipality.unscoped to get
  #   access to :geom
  default_scope select(['municipalities.id',
                        'municipalities.name',
                        'municipalities.muni_id',
                        'municipalities.community_subtype_id',
                        'municipalities.created_at',
                        'municipalities.updated_at',
                        'municipalities.county_id'])
  
  def to_param
    name.downcase
  end

  GEOFACTORY = RGeo::Geographic.spherical_factory(srid: 4326)
  set_rgeo_factory_for_column(:geom, GEOFACTORY)

  def community_type
    community_subtype.community_type unless community_subtype.nil?
  end

  def subregion_name
    subregions.pluck(:name).first || nil
  end

end
