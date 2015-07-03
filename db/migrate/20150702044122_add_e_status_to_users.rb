class AddEStatusToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :e_status, :boolean, default: '1'
  end
end
