require "rails_helper"

describe Venue do
  it { is_expected.to validate_presence_of(:meetup_id) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:latitude) }
  it { is_expected.to validate_presence_of(:longitude) }
end
