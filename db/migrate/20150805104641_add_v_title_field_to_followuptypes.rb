class AddVTitleFieldToFollowuptypes < ActiveRecord::Migration
  def change
  	add_column :followuptypes, :v_title, :string
  end
end
