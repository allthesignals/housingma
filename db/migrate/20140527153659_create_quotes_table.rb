class CreateQuotesTable < ActiveRecord::Migration
  def change
    create_table :quotations do |t|
      t.string   :quote
      t.string   :author
      t.string   :agency
      t.integer  :sort_order
      t.integer  :topic_id

      t.timestamps
    end
  end
end
