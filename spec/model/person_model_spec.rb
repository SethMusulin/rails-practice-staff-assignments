require 'rails_helper'

describe Person do
  it "does not allow a person to be created without either a title/last_name or a first_name/last_name" do

    person = Person.new(title: "Mr.", first_name: "Jumex", last_name: "Fruity")
    expect(person).to be_valid

    person.title= ""
    expect(person).to be_valid

    person.first_name = ""
    expect(person).to_not be_valid

    person.title = "Mr."
    person.first_name = "Jumex"
    expect(person).to be_valid

    person.last_name = ""
    expect(person).to_not be_valid

  end
end

