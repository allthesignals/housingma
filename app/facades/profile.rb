class Profile

  attr_reader :muni

  def initialize(municipality)
    @muni = municipality
  end

  # Housing Data

  def housing
    @muni.housing_data
  end

  def region
    @muni.regions.first
  end

  def county
    @muni.county
  end

  def community_type
    @muni.community_type
  end

  def neighbors
    @muni.neighbors
  end

  def state
    @muni.state
  end

  def neighboring
    neighbors.municipalities.sort_by {|m| m.name}
  end

  def similar_munis
    community_type.municipalities
  end

end