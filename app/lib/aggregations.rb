module Aggregations

  ROUND = 2

  def method_missing(method_name, *args)
    return total($1.to_sym)   if method_name =~ /^total_(.*)/
    return median($1.to_sym)  if method_name =~ /^median_(.*)/
    return average($1.to_sym) if method_name =~ /^average_(.*)/
  end


  def total(attribute)
    values = values(attribute)
    return nil if values.empty?

    values.inject(0.0) { |sum, el| sum += el.to_f }.round(ROUND)
  end


  def average(attribute)
    total = total(attribute)
    return nil if total.nil?
    
    (total / housing_data.length).round(ROUND)
  end


  def median(attribute)
    values = values(attribute)
    return nil if values.empty? # Short circuit if it's an empty array

    sorted = values.map{ |el| el.to_f }.sort # Otherwise, convert to floats and sort
    length = sorted.length

    median = (sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0
    median.round(ROUND)
  end

  private

    def values(attribute)
      housing_data.map{ |h| h.send(attribute) }.compact
    end

end