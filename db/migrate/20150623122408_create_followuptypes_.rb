class CreateFollowuptypes < ActiveRecord::Migration
  def change
    create_table :followuptypes do |t|

      t.timestamps null: false
    end
  end
end
