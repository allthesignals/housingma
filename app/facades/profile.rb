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

  def community_type
    @muni.community_type
  end

  def county
    @muni.county
  end

  # def state_name
  #   @muni.state.name
  # end
  
  private

    attr_reader :muni

end