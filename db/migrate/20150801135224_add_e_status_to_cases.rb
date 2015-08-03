class AddEStatusToCases < ActiveRecord::Migration
  def change
  	add_column :cases, :e_status, :string
  end
end
