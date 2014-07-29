require "rails_helper"

feature "Assignments" do

  scenario "user can add and edit assignments to people" do
    create_user email: "user@example.com"
    Location.create!(:name => "Deep south")
    Location.create!(:name => "Texas")

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

    click_link("+ Add Location")

    select "Deep south", from: "assignment_location_id"
    fill_in "Role", with: "Supervisor"
    click_on "Assign"

    expect(page).to have_content("Some User")
    expect(page).to have_content("Supervisor")
    expect(page).to have_content("Deep south")

    visit root_path

    expect(page).to have_content "Location"
    expect(page).to have_content "1"

    click_link("Some")
    click_link("edit")

    expect(page).to have_content("Edit Assignment")

    select "Texas", from: "assignment_location_id"
    fill_in "Role", with: "Employee"
    click_on "Assign"

    expect(page).to have_content("Some User")
    expect(page).to_not have_content("Supervisor")
    expect(page).to_not have_content("Deep south")

    expect(page).to have_content("Employee")
    expect(page).to have_content("Texas")

  end
end