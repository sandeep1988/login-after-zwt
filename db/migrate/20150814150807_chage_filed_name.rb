class ChageFiledName < ActiveRecord::Migration
  def change
  	rename_column :followups, :contact_id, :action_type
  end
end