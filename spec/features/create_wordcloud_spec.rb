require 'rails_helper'

feature 'Creating Wordclouds' do
  scenario 'a user visits the homepage' do
    visit '/'
    expect(page).to have_content('Enter Twitter handle to Cloudify tweets!')
  end
end
