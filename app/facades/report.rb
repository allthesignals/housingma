class Report < CommonFacade
  def initialize(municipality)
    @topic_areas = TopicArea.all
    super
  end

  def json_path
    # municipality_profile_path(@muni, format: :json)
    "/#{@muni.to_param}/profile.json"
  end
end