class AddVContactTypeToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :v_contact_type, :boolean, :default => 1
  end
end
