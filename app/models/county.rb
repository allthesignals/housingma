class County < ActiveRecord::Base
  establish_connection 'commondata'

  has_many :municipalities
  has_many :housing_data,  through: :municipalities

  default_scope { includes(:municipalities).includes(:housing_data) }

  def short_name
    name.gsub(/\scounty$/i, '')
  end

  def to_s
    short_name
  end

  include Aggregations
end
