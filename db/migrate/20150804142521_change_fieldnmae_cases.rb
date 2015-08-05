class ChangeFieldnmaeCases < ActiveRecord::Migration
  def change
    rename_column :cases, :v_sales_person_id, :user_id
  end
end
