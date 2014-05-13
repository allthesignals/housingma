class Municipality < ActiveRecord::Base
  establish_connection 'commondata'

  GEOFACTORY = RGeo::Geographic.spherical_factory(srid: 4326)
  set_rgeo_factory_for_column(:geom, GEOFACTORY)

  attr_accessor   :neighbors
  attr_accessible :name, :muni_id, :geom
  
  has_one :housing_data, foreign_key: 'muni_id'
  
  belongs_to :community_subtype
  delegate   :community_type,   to: :community_subtype, allow_nil: true
  belongs_to :county
  belongs_to :state
  
  has_and_belongs_to_many :regions
  has_and_belongs_to_many :subregions

  def to_param
    name.downcase.parameterize
  end

  def to_s
    name
  end


  # Prevent :geom from being selected
  #   call Municipality.unscoped to get
  #   access to :geom

  default_scope { includes(:housing_data) }
  # default_scope { select(['municipalities.id',
  #                       'municipalities.name',
  #                       'municipalities.muni_id',
  #                       'municipalities.community_subtype_id',
  #                       'municipalities.created_at',
  #                       'municipalities.updated_at',
  #                       'municipalities.county_id',
  #                       'municipalities.state_id']).order('municipalities.id') }
  
  # scope
  def nearest(lim=10)
    scope = Municipality.unscoped
    scope = scope.where("muni_id != #{self.muni_id}")
    scope = scope.order("ST_Centroid(geom) <-> (
                          SELECT ST_Centroid(geom)
                          FROM municipalities
                          WHERE muni_id = #{self.muni_id})")
    scope = scope.limit(lim)
  end

  # object
  def neighbors
    @neighbors ||= Neighbors.new(self)
  end

  def subregion_name
    subregions.pluck(:name).first || nil
  end

end