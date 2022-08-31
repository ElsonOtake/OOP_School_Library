require 'spec_helper'

describe Nameable do
  it "#new" do
    nameable = Nameable.new
    expect(nameable).to be_instance_of Nameable
  end
end