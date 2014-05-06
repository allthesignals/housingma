class AddOperationToField < ActiveRecord::Migration
  def change
    add_column :fields, :operation, :string, default: 'average'
  end
end
