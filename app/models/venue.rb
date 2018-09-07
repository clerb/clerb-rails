class Venue < ApplicationRecord
  has_many :events

  validates :meetup_id, :name, :latitude, :longitude, presence: true
end
