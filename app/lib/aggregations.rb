module Aggregations
  def method_missing(method_name, *args)
    return total($1.to_sym)   if method_name =~ /^total_(.*)/
    return median($1.to_sym)  if method_name =~ /^median_(.*)/
    return average($1.to_sym) if method_name =~ /^average_(.*)/
  end


  def total(attribute)
    municipalities.includes(:housing_data).inject(0.0) {|sum, m| sum + m.housing_data.send(attribute)}
  end


  def average(attribute)
    total(attribute) / municipalities.count
  end


  def median(attribute)
    sorted = municipalities.includes(:housing_data).map {|m| m.housing_data.send(attribute)}.sort
    length = sorted.length

    (sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0
  end
end
