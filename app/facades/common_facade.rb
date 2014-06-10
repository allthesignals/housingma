class CommonFacade

  attr_reader :muni,
              :housing,
              :region,
              :county,
              :community_type,
              :neighbors,
              :state,
              :topic_areas

  def initialize(municipality)
    @muni = municipality
  
    # Housing Data
    @housing        = @muni.housing_data
    @neighbors      = @muni.neighbors
    @community_type = @muni.community_type
    @region         = @muni.regions.first
    @county         = @muni.county
    @state          = @muni.state
  end

  def method_missing(method_name, *args)
    @housing.send(method_name)
  end

end