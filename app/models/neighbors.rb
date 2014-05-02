class Neighbors

  attr_reader  :municipalities
  alias_method :munis, :municipalities

  def initialize(muni)
    @municipalities = muni.nearest
  end

  include Aggregations
end