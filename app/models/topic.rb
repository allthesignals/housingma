class Topic < Grouping
  has_many   :subtopics
  has_many   :fields,   through: :subtopics
  belongs_to :topic_area

  def lonely_fields
    fields.where(subtopic_id: nil)
  end

  def has_subtopics?
    !subtopics.blank?
  end
end
