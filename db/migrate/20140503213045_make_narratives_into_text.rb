class MakeNarrativesIntoText < ActiveRecord::Migration
  def up
    change_column :topic_areas, :narrative, :text
    change_column :topics,      :narrative, :text
    change_column :subtopics,   :narrative, :text
  end

  def down
    change_column :topic_areas, :narrative, :string
    change_column :topics,      :narrative, :string
    change_column :subtopics,   :narrative, :string
  end
end
