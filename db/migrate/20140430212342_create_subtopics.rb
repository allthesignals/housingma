class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics do |t|
      t.string :title
      t.string :narrative
      t.string :sort_order

      t.timestamps
    end
  end
end
