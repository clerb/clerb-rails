module ApplicationHelper
  def event_display_date(event)
    event.start_time.in_time_zone("Eastern Time (US & Canada)").strftime("%a, %b %e, %Y")
  end

  def event_display_time(event)
    str = event.start_time.in_time_zone("Eastern Time (US & Canada)").strftime("%l:%M%p")
    if event.end_time && event.end_time != event.start_time
      end_time = event.end_time.in_time_zone("Eastern Time (US & Canada)").strftime("%l:%M%p")
      str = "#{str} - #{end_time}"
    end
    str
  end

  def google_maps_link(address)
    "https://maps.google.com/?q=#{address}"
  end

  def google_maps_embed_link(address)
    "https://www.google.com/maps/embed/v1/place?q=#{address}&key=#{ENV['GOOGLE_MAPS_API_KEY']}"
  end

  def venue_address(event)
    "#{event.venue.name}, #{event.venue.address}, #{event.venue.city}, #{event.venue.state}"
  end
end
