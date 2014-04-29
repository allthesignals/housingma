class Region < ActiveRecord::Base
  establish_connection 'commondata'
  has_and_belongs_to_many :municipalities

  def total_ro
    municipalities.includes(:housing_data).inject(0.0) {|sum, m| sum + m.housing_data.ro}
  end

  def average_ro
    total_ro / municipalities.count
  end

  def median_ro
    sorted = municipalities.includes(:housing_data).map {|m| m.housing_data.ro}.sort

    length = sorted.length
    return (sorted[(length - 1) / 2] + sorted[length / 2]) / 2.0
  end

end