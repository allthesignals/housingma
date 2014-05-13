module Aggregations
  def method_missing(method_name, *args)
    return total($1.to_sym)   if method_name =~ /^total_(.*)/
    return median($1.to_sym)  if method_name =~ /^median_(.*)/
    return average($1.to_sym) if method_name =~ /^average_(.*)/
  end


  def total(attribute)
    housing_data.inject(0.0) { |sum, h| sum += h.send(attribute) }
  end


  def average(attribute)
    total(attribute) / housing_data.length
  end


  def median(attribute)
    # Don't know if #sort or #order is the faster way
    sorted = housing_data.map{ |h| h.send(attribute) }.sort
    length = sorted.length

    (sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0
  end
end