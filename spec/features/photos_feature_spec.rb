require 'rails_helper'

feature 'photos' do
  context 'no photos have been posted' do
    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(name: 'hello world')
    end
    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('hello world')
      expect(page).not_to have_content('No photos yet')
    end
  end

  context 'creating photos' do
    scenario 'prompt user to fill out a form, then displays the new photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Name', with: 'hello world'
      click_button 'Create Photo'
      expect(page).to have_content 'hello world'
      expect(current_path).to eq '/photos'
    end
  end

  context 'viewing photos' do
    let!(:hi){ Photo.create(name:'hi') }
    scenario 'lets a user view a photo' do
      visit '/photos'
      click_link 'hi'
      expect(page).to have_content 'hi'
      expect(current_path).to eq "/photos/#{hi.id}"
    end
  end

  context 'editing photos' do
    before { Photo.create name: 'hi' }
    scenario 'let a user edit a posted photo' do
      visit '/photos'
      click_link 'Edit hi'
      fill_in 'Name', with: 'hello'
      click_button 'Update Photo'
      expect(page).to have_content 'hello'
      expect(current_path).to eq '/photos'
    end
  end

end
