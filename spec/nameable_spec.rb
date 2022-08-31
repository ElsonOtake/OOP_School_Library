require 'spec_helper'

describe Nameable do
  it '#new' do
    nameable = Nameable.new
    expect(nameable).to be_instance_of Nameable
  end

  it 'should generate NotImplementedError error' do
    nameable = Nameable.new
    expect { nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
