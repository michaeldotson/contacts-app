class AddLattituteLongitudeToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :lattitude, :float
    add_column :contacts, :longitude, :float
  end
end
