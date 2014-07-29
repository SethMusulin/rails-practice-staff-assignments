require 'spec_helper'


feature 'User' do

  scenario 'User can view a person show page' do
    create_user email: "user@example.com"

    visit root_path
    click_on "Login"
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_on "Login"
    expect(page).to have_content("user@example.com")

    click_link("New Person")

    fill_in "Title", with: "Mr."
    fill_in "First name", with: "Some"
    fill_in "Last name", with: "User"
    click_on "Create Person"

    click_link("Some")

    expect(page).to have_content("Some User")

  end

  feature 'User' do

    scenario "User can edit a person's information" do
      create_user email: "user@example.com"

      visit root_path
      click_on "Login"
      expect(page).to have_content("Username / password is invalid")

      fill_in "Email", with: "user@example.com"
      fill_in "Password", with: "password"
      click_on "Login"
      expect(page).to have_content("user@example.com")

      click_link("New Person")

      fill_in "Title", with: "Mr."
      fill_in "First name", with: "Some"
      fill_in "Last name", with: "User"
      click_on "Create Person"

      click_link("Some")
      click_link("Edit Person")

      fill_in "Title", with: "Mrs."
      fill_in "First name", with: "Some Other"
      fill_in "Last name", with: "User"
      click_on "Edit Person"

      expect(page).to have_content("Some Other")

    end
  end
end