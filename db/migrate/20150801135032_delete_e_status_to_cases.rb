class DeleteEStatusToCases < ActiveRecord::Migration
  def change
  	remove_column :cases, :e_status
  end
end
