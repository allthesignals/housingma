class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string  :title
      t.string  :narrative
      t.string  :alias
      t.integer :sort_order
      t.integer :subtopic_id
      
      t.timestamps
    end
  end
end
