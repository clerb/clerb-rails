task refresh_meetup_events: :environment do
  Event.refresh_from_meetup!
end
