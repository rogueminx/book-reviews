require 'rails_helper'

describe "the add a user process" do
  it "adds a new user" do
    visit root_path
    click_link 'Please Login!'
    fill_in 'Name', :with => 'Ron'
    click_on 'Add User'
    expect(page).to have_content 'Ron'
  end

end
