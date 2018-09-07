require "open-uri"

MEETUP_EVENTS_URL = "https://api.meetup.com/ClevelandRuby/events?status=past,upcoming".freeze

class Event < ApplicationRecord
  belongs_to :venue, optional: true

  validates :meetup_id, :meetup_link, :name, :start_time, :end_time, presence: true

  scope :latest, -> { order(start_time: :desc) }

  class << self
    def refresh_from_meetup!
      # Using Kernel.open is a security risk for user-provided input (since it
      # can be manipulated with the pipe operator) but is not a risk with predefined
      # constant input.
      open(MEETUP_EVENTS_URL) do |http| # rubocop:disable Security/Open
        JSON.parse(http.read).each do |event|
          venue = nil
          if event.dig("venue", "id")
            venue = Venue.find_or_create_by(meetup_id: event.dig("venue", "id"))
            venue.update(
              name: event.dig("venue", "name"),
              address: event.dig("venue", "address_1"),
              city: event.dig("venue", "city"),
              state: event.dig("venue", "state"),
              latitude: event.dig("venue", "lat"),
              longitude: event.dig("venue", "lon")
            )
          end

          event_record = Event.find_or_create_by(meetup_id: event["id"])

          start_time = Time.strptime(event["time"].to_s, "%Q")
          end_time =
            if event["duration"]
              Time.strptime((event["time"] + event["duration"]).to_s, "%Q")
            else
              start_time
            end

          event_record.update(
            venue: venue,
            meetup_link: event["link"],
            name: event["name"],
            description: event["description"],
            start_time: start_time,
            end_time: end_time,
            num_attendees: event["yes_rsvp_count"]
          )
        end
      end
    end
  end
end
