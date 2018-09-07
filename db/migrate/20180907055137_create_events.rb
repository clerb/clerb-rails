class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :venue
      t.string :meetup_id
      t.string :meetup_link
      t.string :name
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :num_attendees
      t.timestamps
    end
  end
end
