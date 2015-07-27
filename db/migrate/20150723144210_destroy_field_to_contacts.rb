class DestroyFieldToContacts < ActiveRecord::Migration
  def change
  	remove_column :contacts, :compnay_name
  end
end
