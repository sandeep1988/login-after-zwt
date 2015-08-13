class ChangeFollowupFieldname < ActiveRecord::Migration
  def change
  	add_column :followups, :e_status,  :string
  end
end
