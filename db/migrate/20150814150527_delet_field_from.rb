class DeletFieldFrom < ActiveRecord::Migration
  def change
  	remove_column :followups, :case_id
  end
end
