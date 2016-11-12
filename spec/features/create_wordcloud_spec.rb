require 'rails_helper'

feature 'Creating Wordclouds' do
  scenario 'a user visits the homepage' do
    visit '/'
    expect(page).to have_content 'Enter Twitter handle to Cloudify tweets!'
  end

  scenario 'a user enters a Twitter handle and sees 10 recent tweets' do
    visit '/'
    fill_in 'wordcloud_username', with: 'abigail_mcp'
    click_on 'Cloudify!'
    expect(find('ul')).to have_selector('li', count: 10)
  end
end
