class MakeNullNarrativesBlank < ActiveRecord::Migration
  def up
    change_column  :topic_areas, :narrative, :text, null: false, default: ''
    change_column  :topics,      :narrative, :text, null: false, default: ''
    change_column  :subtopics,   :narrative, :text, null: false, default: ''
  end

  def down
    change_column  :topic_areas, :narrative, :text, null: true, default: nil
    change_column  :topics,      :narrative, :text, null: true, default: nil
    change_column  :subtopics,   :narrative, :text, null: true, default: nil
  end
end
