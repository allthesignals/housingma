class Field < Grouping
  attr_accessible :name,  :description, :alias, :subtopic_id, :id
  attr_accessor   :title, :narrative

  belongs_to :subtopic
  delegate   :topic, to: :subtopic, allow_nil: true

  validates :alias, presence: true, length: { minimum: 3, maximum: 140 }

  alias_attribute :name, :title
  alias_attribute :description, :narrative
end
