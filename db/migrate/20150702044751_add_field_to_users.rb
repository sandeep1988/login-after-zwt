class AddFieldToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :v_firstname, :string
  	add_column :users, :v_lastname, :string
  	add_column :users, :v_im_skype, :string
  	add_column :users, :v_im_password, :string
  	add_column :users, :v_gmail, :string
  	add_column :users, :v_linkedin_url, :string
  	add_column :users, :v_phone, :string
  end
end