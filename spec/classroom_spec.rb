require 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new("Math")
  end

  describe "#new" do
    context "With another parameters" do
      it "Has no label" do
        classroom = Classroom.new("Chemistry")
        expect(classroom.label).not_to eq "Math"
      end
    end
    context "With parameters defined on before each" do
      it "Has Math as label" do
        expect(@classroom.label).to eq "Math"
      end
    end
  end
end