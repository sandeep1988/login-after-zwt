class ChangeFollowdate < ActiveRecord::Migration
  def change
  	change_column :followups, :followed_up_date,  :string
  end
end
