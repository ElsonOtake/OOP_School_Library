require 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new('Ruby', 45, 'Elson')
  end
  describe '#new' do
    it 'teacher should be instance of Teacher class' do
      expect(@teacher).to be_instance_of Teacher
    end

    it 'teacher name have the name Elson' do
      expect(@teacher.name).to eq 'Elson'
    end

    it 'teacher should have a Ruby specialization' do
      expect(@teacher.specialization).to eq 'Ruby'
    end

    it 'teacher should have a parent permisssion' do
      expect(@teacher.parent_permission).to be_truthy
    end

    it 'teacher age should be 45' do
      expect(@teacher.age).to be 45
    end

    it 'teacher can use service' do
      expect(@teacher.can_use_services?).to be_truthy
    end
  end
end
