class CreateTopicAreas < ActiveRecord::Migration
  def change
    create_table :topic_areas do |t|
      t.string  :title
      t.string  :narrative
      t.integer :sort_order

      t.timestamps
    end
  end
end
