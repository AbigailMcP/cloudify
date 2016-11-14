require 'rails_helper'

feature 'Creating Wordclouds' do

  scenario 'a user visits the homepage' do
    visit '/'
    expect(page).to have_content 'Enter a Twitter handle to reveal their Tweet cloud'
  end

  scenario 'a user enters a Twitter handle and sees word cloud for that user' do
    create_cloud
    expect(page).to have_content 'Tweet cloud for @abigail_mcp'
  end

  scenario 'a user can return to homepage' do
    create_cloud
    click_on 'Back'
    expect(current_path).to eq root_path
  end
end
