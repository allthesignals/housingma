class Field < Grouping
  attr_accessible :alias, :name, :description
  attr_accessor :title, :narrative

  belongs_to :subtopic
  delegate   :topic, to: :subtopic, allow_nil: true

  alias_method :name, :title
  alias_method :description, :narrative

end
