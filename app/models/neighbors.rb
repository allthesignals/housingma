class Neighbors

  attr_reader  :municipalities, :housing_data
  alias_method :munis, :municipalities

  def initialize(muni)
    @municipalities = muni.nearest
    @housing_data   = HousingData.where('muni_id IN (?)', @municipalities.map { |m| m.id })
  end

  def to_s
    "Nearest Ten"
  end

  include Aggregations
end