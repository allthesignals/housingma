class Field < ActiveRecord::Base
  attr_accessible :name, :description, :title, :narrative, :alias, :id, :subtopic_id
  
  alias_attribute :name, :title
  alias_attribute :description, :narrative

  belongs_to :subtopic
  delegate   :topic, to: :subtopic, allow_nil: true

  validates :title,     presence: true,    length: { minimum: 1, maximum: 140 }
  validates :alias,     presence: true,    length: { minimum: 3, maximum: 140 }
  validates :narrative, allow_blank: true, length: { minimum: 3, maximum: 8000 }

  default_scope { order(:sort_order).order(:id) }

  def to_s
    title
  end

end
