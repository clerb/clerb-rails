require "rails_helper"

feature "Homepage" do
  before do
    create(:event, name: "Katas and hang")
  end

  it "successfully loads" do
    visit "/"
    expect(page).to have_content("Cleveland Ruby Brigade")
    expect(page).to have_content("Katas and hang")
  end
end
