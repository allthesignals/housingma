class Profile

  def initialize(municipality)
    @muni = municipality
  end

  # Names

  def muni_name
    @muni.name
  end

  def region_name
    @muni.regions.first.name
  end

  def county_name
    @muni.county.short_name
  end

  def community_type_name
    @muni.community_type.name
  end

  # Housing Data

  def muni_housing
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
    Municipality.find((1..351).to_a.sample(10))
  end

  def similar_munis
    community_type.municipalities
  end


  # def state_name
  #   @muni.state.name
  # end
  
  private

    attr_reader :muni

end