class AddFieldToContact < ActiveRecord::Migration
  def change
  	add_column :contacts, :v_company_name, :string
  	add_column :contacts, :v_im_skype, :string
  	add_column :contacts, :v_website_url, :string
  	add_column :contacts, :v_linkedin_url, :string
  	add_column :contacts, :v_phone, :string
  	add_column :contacts, :v_cell_number, :string
  	add_column :contacts, :v_tags, :string
  	add_column :contacts, :i_reffered_source_id, :string
  	add_column :contacts, :e_status, :boolean, :default => false
  end
end
