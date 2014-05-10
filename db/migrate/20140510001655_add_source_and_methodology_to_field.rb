class AddSourceAndMethodologyToField < ActiveRecord::Migration
  def change
    add_column :fields, :source,      :string
    add_column :fields, :methodology, :text
  end
end
