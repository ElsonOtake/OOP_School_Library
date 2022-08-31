require 'spec_helper'

# describe CapitalizeDecorator do
#   it "#new" do
#     capitalize = CapitalizeDecorator.new("mario")
#     expect(capitalize).to be_instance_of CapitalizeDecorator
#     expect(capitalize.nameable).to eq "mario"
#     expect(capitalize.correct_name).to eq "Mario"
#   end
# end

describe CapitalizeDecorator do
  it "test correct name method" do
    person = Person.new(22, 'maximilianus')
    capitalize = CapitalizeDecorator.new(person)
    expect(capitalize.correct_name).to eq "Maximilianus"
    # capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
    # capitalizedTrimmedPerson.correct_name
  end
end