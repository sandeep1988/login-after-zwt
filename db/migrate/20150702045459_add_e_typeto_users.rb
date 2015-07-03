class AddETypetoUsers < ActiveRecord::Migration
  def change
  	add_column :users, :e_type, :boolean, default: '1'
  end
end
