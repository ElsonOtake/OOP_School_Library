require 'spec_helper'

describe Decorator do
  it "New decorator" do
    decorator = Decorator.new("mario")
    expect(decorator.nameable).to eq "mario"
  end
end