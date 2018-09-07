require 'rails_helper'

feature 'Homepage' do
  it 'successfully loads' do
    visit '/'
    expect(page).to have_content('Cleveland Ruby Brigade')
  end
end
