class ChangeContatIdCases < ActiveRecord::Migration
  def change
    rename_column :cases, :v_contact_id, :contact_id
  end
end
