class Field < ActiveRecord::Base
  attr_accessible :alias,
                  :description,
                  :name,
                  :narrative,
                  :title
  
  alias_attribute :name, :title
  alias_attribute :description, :narrative

  belongs_to :subtopic
  delegate   :topic, to: :subtopic, allow_nil: true

  OPERATIONS = %w( average median total )

  validates :title,     presence:    true, length: { minimum: 1, maximum: 140 }
  validates :alias,     presence:    true, length: { minimum: 3, maximum: 140 }
  validates :narrative, allow_blank: true, length: { minimum: 3, maximum: 8000 }
  validates :operation, presence:    true, inclusion: { in: OPERATIONS }

  default_scope { order(:sort_order).order(:id) }

  def full_alias
    "#{self.operation.titleize} #{self.alias}"
  end

  def with_op
    "#{operation}_#{title}"
  end

  def to_s
    title
  end

end
