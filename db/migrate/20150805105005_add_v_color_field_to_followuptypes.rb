class AddVColorFieldToFollowuptypes < ActiveRecord::Migration
  def change
  	add_column :followuptypes, :v_color, :string
  end
end
