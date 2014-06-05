class HousingData < ActiveRecord::Base
  establish_connection 'housing_data'
  self.table_name        = 'hpp_view'
  self.primary_key = :muni_id

  belongs_to :municipality, foreign_key: 'muni_id'
end