class AddVCountryToContacts < ActiveRecord::Migration
  def change
  	add_column :contacts, :v_country, :string
  end
end
