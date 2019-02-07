class RemoveLongitudeLattitudeLatitudeFromContacts < ActiveRecord::Migration[5.2]
  def change
    remove_column :contacts, :latitude, :float
    remove_column :contacts, :lattitude, :float
    remove_column :contacts, :longitude, :float
  end
end
