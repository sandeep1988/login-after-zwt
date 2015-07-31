class DeleteVContactTypeToContact < ActiveRecord::Migration
  def change
  	remove_column :contacts, :v_contact_type
  end
end
