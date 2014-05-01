class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string  :title
      t.string  :narrative
      t.string  :sort_order
      t.integer :topic_area_id

      t.timestamps
    end
  end
end
