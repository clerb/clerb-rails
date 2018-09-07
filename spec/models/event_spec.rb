require "rails_helper"

describe Event do
  it { is_expected.to validate_presence_of(:meetup_id) }
  it { is_expected.to validate_presence_of(:meetup_link) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:start_time) }
  it { is_expected.to validate_presence_of(:end_time) }

  describe "#refresh_from_meetup!" do
    before do
      events_json = File.read(Rails.root.join("spec", "fixtures", "events.json"))
      stub_request(:get, MEETUP_EVENTS_URL).to_return(status: 200, body: events_json)
    end

    subject(:refresh_from_meetup!) { described_class.refresh_from_meetup! }

    context "when events and venues do not exist" do
      it "creates events" do
        expect { refresh_from_meetup! }.to change { Event.count }.by(2)
      end

      it "sets start_time and end_time for event without duration" do
        refresh_from_meetup!
        event = Event.find_by(meetup_id: "6705291")
        expect(event.start_time.time).to eq(Time.utc(2007, 12, 13, 23, 30, 0))
        expect(event.end_time.time).to eq(Time.utc(2007, 12, 13, 23, 30, 0))
      end

      it "sets start_time and end_time for event with duration" do
        refresh_from_meetup!
        event = Event.find_by(meetup_id: "6492165")
        expect(event.start_time.time).to eq(Time.utc(2007, 11, 8, 23, 0, 0))
        expect(event.end_time.time).to eq(Time.utc(2007, 11, 8, 23, 30, 0))
      end
    end

    context "when one event already exists" do
      before do
        create(:event, meetup_id: "6492165")
      end

      it "creates event that doesn't exist yet" do
        expect { refresh_from_meetup! }.to(change { Event.count }.by(1))
      end

      it "updates existing event" do
        refresh_from_meetup!
        event = Event.find_by(meetup_id: "6492165")
        expect(event.name).to eq("The Cleveland/North East Ohio Ruby Users Group November Meetup")
      end
    end

    context "when venue already exists" do
      before do
        create(:venue, meetup_id: "414787")
      end

      it "does not recreate venue" do
        expect { refresh_from_meetup! }.to_not(change { Venue.count })
      end

      it "links event to venue" do
        refresh_from_meetup!
        event = Event.find_by(meetup_id: "6492165")
        expect(event.venue.meetup_id).to eq("414787")
      end
    end
  end
end
