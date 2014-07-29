require 'rails_helper'

describe "Assignments" do
  it "Assignment cannot be created without a location or a role" do
    person = Person.create(first_name: "The", last_name: "One")
    location = Location.create(name: "Deep south")
    assignment = Assignment.new(person_id: person.id, location_id: location.id, role: "Boss")
    expect(assignment).to be_valid

    assignment.location_id = nil
    expect(assignment).to_not be_valid

    assignment.location_id = location.id
    expect(assignment).to be_valid

    assignment.role = nil
    expect(assignment).to_not be_valid
  end

  it "Assingment cannot be created with the same role and location more than once" do
  person = Person.create(first_name: "The", last_name: "One")
  location = Location.create(name: "Deep south")
  assignment = Assignment.create(person_id: person.id, location_id: location.id, role: "Boss")
  expect(assignment).to be_valid

  assignment2 = Assignment.new(person_id: person.id, location_id: location.id, role: "Employee")
  expect(assignment2).to be_valid

  assignment2.role = "Boss"
  expect(assignment2).to_not be_valid

  end
end