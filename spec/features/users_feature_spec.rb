require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

    it "must be logged in to create post" do
      visit('/')
      click_link('Add a photo')
      expect(page).not_to have_button('Add a photo')
    end
  end

  context "user signed in on the homepage" do
    before do
      user = build :user
      sign_up(user)
    end

    it "can edit photos which they posted" do
      visit('/')
      click_link('Add a photo')
      fill_in 'Name', with: 'hello'
      click_button 'Create Photo'
      expect(page).to have_link 'Edit hello'
    end

    it "cannot edit photos which they did not post" do
      visit('/')
      click_link('Add a photo')
      fill_in 'Name', with: 'hello'
      click_button 'Create Photo'
      click_link 'Sign out'
      user = build :user2
      sign_up(user)
      expect(page).not_to have_link('Edit hello')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
