module Aggregations

  ROUND = 2

  def method_missing(method_name, *args)
    return total($1.to_sym)   if method_name =~ /^total_(.*)/
    return median($1.to_sym)  if method_name =~ /^median_(.*)/
    return average($1.to_sym) if method_name =~ /^average_(.*)/
  end


  def total(attribute)
    housing_data.inject(0.0) { |sum, h| sum += h.send(attribute).to_f }.round(ROUND)
  end


  def average(attribute)
    (total(attribute) / housing_data.length).round(ROUND)
  end


  def median(attribute)
    # Don't know if #sort or #order is the faster way
    sorted = housing_data.map{ |h| h.send(attribute).to_f }.sort
    length = sorted.length

    median = (sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0
    median.round(ROUND)
  end
end