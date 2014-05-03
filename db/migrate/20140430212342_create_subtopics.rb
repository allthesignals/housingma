class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics do |t|
      t.string   :title
      t.string   :narrative
      t.integer  :sort_order
      t.integer  :topic_id

      t.timestamps
    end
  end
end
