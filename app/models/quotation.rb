class Quotation < ActiveRecord::Base
  attr_accessible :quote, :author, :agency, :sort_order

  validates :quote,     presence: true, length: { minimum: 3, maximum: 1700 }
  validates :author,    presence: true, length: { minimum: 3, maximum: 100 }
  validates :agency,    allow_blank: true, length: { minimum: 3, maximum: 180 }

  scope :latest, where(published: true).order('updated_at DESC').limit(3)
  scope :random, where(published: true).order('RANDOM()').limit(3)
  
end
