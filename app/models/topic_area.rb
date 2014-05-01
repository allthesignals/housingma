class TopicArea < Grouping
  has_many :topics
  has_many :subtopics, through: :topics
end