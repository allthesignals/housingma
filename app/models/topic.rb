class Topic < Grouping
  has_many :subtopics
  belongs_to :topic_area
end
