require "rails_helper"

feature "Companies" do
  it "successfully loads" do
    visit "/companies"
    expect(page).to have_content("Companies In Cleveland Which Use Ruby")
  end
end
