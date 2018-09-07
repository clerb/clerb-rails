require "rails_helper"

feature "Events" do
  before do
    create(:event, name: "Katas and hang")
  end

  it "successfully loads" do
    visit "/events"
    expect(page).to have_content("Katas and hang")
  end
end
