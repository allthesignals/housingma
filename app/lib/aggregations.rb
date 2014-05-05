module Aggregations
  def method_missing(method_name, *args)
    return total($1.to_sym)   if method_name =~ /^total_(.*)/
    return median($1.to_sym)  if method_name =~ /^median_(.*)/
    return average($1.to_sym) if method_name =~ /^average_(.*)/
  end


  def total(attribute)
    HousingData.sum(attribute, conditions: ['muni_id IN (?)', municipalities.pluck(:id)])
  end


  def average(attribute)
    HousingData.average(attribute, conditions: ['muni_id IN (?)', municipalities.pluck(:id)])
  end


  def median(attribute)
    # Don't know if #sort or #order is the faster way
    sorted = HousingData.where(muni_id: municipalities.pluck(:id)).pluck(attribute).sort
    length = sorted.length

    (sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0
  end
end