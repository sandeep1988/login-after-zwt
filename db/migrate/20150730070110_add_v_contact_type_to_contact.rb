class AddVContactTypeToContact < ActiveRecord::Migration
  def change
  	add_column :contacts, :v_contact_type, :boolean, :default => false
  end
end
