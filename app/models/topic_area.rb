class TopicArea < Grouping
  has_many :topics
  has_many :subtopics, through: :topics

  validates :title,     presence:    true, length: { minimum: 3, maximum: 140 }
  validates :narrative, allow_blank: true, length: { minimum: 3, maximum: 8000 }

  default_scope { order(:sort_order) }
end