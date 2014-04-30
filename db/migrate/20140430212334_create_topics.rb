class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :narrative
      t.string :sort_order

      t.timestamps
    end
  end
end
