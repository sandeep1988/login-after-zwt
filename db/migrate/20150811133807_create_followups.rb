class CreateFollowups < ActiveRecord::Migration
  def change
    create_table :followups do |t|
      t.integer :contact_id
      t.integer :case_id
      t.string :followed_up_date
      t.integer :followed_up_type_id
      t.integer :followed_up_by
      t.text :v_outcome
      t.string :d_next_followed_up_date
      t.integer :next_followed_up_type_id
      t.integer :next_followed_up_by

      t.timestamps null: false
    end
  end
end
