require "rails_helper"
require "timecop"

feature "Events" do
  before do
    starts_at = Time.utc(2018, 9, 1, 10, 0, 0)
    create(:event, name: "Katas and hang", start_time: starts_at, end_time: starts_at + 10.minutes)
  end

  it "successfully loads" do
    visit "/events"
    expect(page).to have_content("Katas and hang")
  end

  it "successfully loads individual event" do
    event = Event.find_by(name: "Katas and hang")
    visit event_path(event)
    expect(page).to have_content("Katas and hang")
  end

  it "shows 'rsvp on meetup' text if the current time is prior to the start time" do
    test_time = Time.utc(2018, 8, 15, 12, 0, 0)
    Timecop.freeze(test_time) do
      event = Event.find_by(name: "Katas and hang")
      visit event_path(event)
      expect(page).to have_content("RSVP on Meetup")
    end
  end

  it "shows 'view on meetup' text if the current time is after the start time" do
    test_time = Time.utc(2018, 10, 15, 12, 0, 0)
    Timecop.freeze(test_time) do
      event = Event.find_by(name: "Katas and hang")
      visit event_path(event)
      expect(page).to have_content("View on Meetup")
    end
  end
end
