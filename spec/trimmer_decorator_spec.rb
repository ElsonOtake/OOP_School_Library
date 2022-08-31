require 'spec_helper'

describe TrimmerDecorator do
  it "test correct name method" do
    person = Person.new(22, 'maximilianus')
    trimmer = TrimmerDecorator.new(person)
    expect(trimmer.correct_name).to eq "maximilian"
  end
  
  it "test correct name method" do
    person = Person.new(23, '   max  ')
    trimmer = TrimmerDecorator.new(person)
    expect(trimmer.correct_name).to eq "max"
  end
end
