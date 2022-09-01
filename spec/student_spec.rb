require 'spec_helper'

describe Student do
  before :each do
    @classroom = Classroom.new('Math')
    @student = Student.new(@classroom, 16)
  end

  describe '#new' do
    it 'Has the Student class' do
      expect(@student).to be_instance_of Student
    end

    it 'Has Math as classroom' do
      expect(@student.classroom.label).to eq 'Math'
    end

    it 'Has Unknown as name' do
      expect(@student.name).to eq 'Unknown'
    end

    it 'Has classroom as instance of Classroom' do
      expect(@student.classroom).to be_instance_of Classroom
    end

    it 'Has age of 16' do
      expect(@student.age).to be 16
    end

    it 'Has parent permission' do
      expect(@student.parent_permission).to be_truthy
    end

    it "Has ¯\(ツ)/¯ as response for play_hooky method" do
      expect(@student.play_hooky).to eq "¯\(ツ)/¯"
    end

    it 'Has Chemistry as new classroom' do
      chemistry = Classroom.new('Chemistry')
      @student.add_classroom(chemistry)
      expect(@student.classroom.label).to eq 'Chemistry'
    end

    it 'Has new name' do
      @student.name = 'Alice'
      expect(@student.name).to eq 'Alice'
    end
  end
end
