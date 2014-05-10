class Neighbors

  attr_reader  :municipalities
  alias_method :munis, :municipalities

  def initialize(muni)
    @municipalities = muni.nearest
  end

  def to_s
    "Nearest Ten"
  end

  include Aggregations
end