require 'rails_helper'

feature 'endorsing photos' do
  before do
    test = Photo.create(name: 'test')
    test.comments.create(thoughts: 'nice')
  end

  scenario 'a user can endorse a photo, which updates the photo endorsement count', js: true do
    visit '/photos'
    click_link 'Endorse Photo'
    expect(page).to have_content('1 endorsement')
  end

end
