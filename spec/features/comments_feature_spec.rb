require 'rails_helper'

feature 'commenting' do
  before { Photo.create name: 'hello world' }

  scenario 'allows users to leave a comment using a form' do
     visit '/photos'
     click_link 'Comment on hello world'
     fill_in 'Thoughts', with: 'Great shot!'
     click_button 'Leave Comment'
     expect(current_path).to eq '/photos'
     expect(page).to have_content('Great shot!')
  end

end
