require 'rails_helper'

module FeatureHelpers
  def create_cloud(username = "abigail_mcp")
    visit '/'
    fill_in 'username', with: username
    click_on 'Cloudify!'
  end
end
