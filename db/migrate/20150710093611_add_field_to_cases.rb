class AddFieldToCases < ActiveRecord::Migration
  def change
    add_column :cases, :v_contact_id, :integer
    add_column :cases, :v_sales_person_id, :integer
    add_column :cases, :v_title, :string
    add_column :cases, :v_desc, :string
    add_column :cases, :v_reference_urls, :string
    add_column :cases, :v_file_attachments, :string
    add_column :cases, :v_tags, :string
    add_column :cases, :e_status, :boolean
    add_column :cases, :v_note, :string
  end
end
