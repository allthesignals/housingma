class HousingData < ActiveRecord::Base
  establish_connection 'hppbackup'
  self.table_name = 'hh_aff_gap_inc_ten'

  belongs_to :municipality, foreign_key: 'muni_id'
end
