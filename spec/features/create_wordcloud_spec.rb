require 'rails_helper'

feature 'Creating Wordclouds' do

  scenario 'a user visits the homepage' do
    visit '/'
    expect(page).to have_content 'Enter a Twitter handle to reveal their Tweet cloud'
  end

  scenario 'a user enters a Twitter handle and sees 10 recent tweets' do
    visit '/'
    fill_in 'wordcloud_username', with: 'abigail_mcp'
    click_on 'Cloudify!'
    expect(page).to have_content 'Tweet cloud for @abigail_mcp'
  end
end
