class DestroyContactTypeToContacts < ActiveRecord::Migration
  def change
  	remove_column :contacts, :Contact
  	remove_column :contacts, :Type
  end
end
