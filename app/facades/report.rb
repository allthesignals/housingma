class Report
  
  attr_reader :muni

  def initialize(muni)
    @muni = muni
  end


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


  def topic_areas
    TopicArea.all
  end
end