class TopicArea < Grouping
  has_many :topics
  has_many :subtopics, through: :topics
  has_many :fields,    through: :subtopics

  # Include associations through subtopics, since the
  # report does not need Field. Include Field in the
  # Profile facade.
  default_scope { includes(:topics).includes(:subtopics) }
end