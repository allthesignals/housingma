class County < ActiveRecord::Base
  establish_connection 'commondata'

  has_many :municipalities

  def short_name
    name.gsub(/\scounty$/i, '')
  end

  def to_s
    short_name
  end

  include Aggregations
end
