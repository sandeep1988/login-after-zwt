class AddVContactTypeToContact < ActiveRecord::Migration
  def change
  	add_column :contacts, :v_contact_type, :integer, :default => 1
  end
end
