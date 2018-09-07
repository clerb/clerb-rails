class CreateVenues < ActiveRecord::Migration[5.2]
  def change
    create_table :venues do |t|
      t.string :meetup_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
