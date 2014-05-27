class AddPublicationFlagFieldToQuotation < ActiveRecord::Migration
  def change
    remove_column :quotations, :topic_id
    add_column :quotations, :published, :boolean, :default => false
  end
end
