class Report < CommonFacade
  def initialize(municipality)
    @topic_areas = TopicArea.all
    super
  end
end