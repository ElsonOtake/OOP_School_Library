require 'spec_helper'

describe Person do
  before :each do
    @person = Person.new(24)
  end

  describe '#new' do
    it 'Has age as the only required parameter' do
      expect(@person).to be_instance_of Person
    end

    it 'Has default value for name as Unknown' do
      expect(@person.name).to eq 'Unknown'
    end

    it 'Has age of 24' do
      expect(@person.age).to be 24
      expect(@person.age).to eq 24
      expect(@person.age).to eql 24
    end

    it 'Has numeric id' do
      expect(@person.id).to be_instance_of Integer
      expect(@person.id).to be_kind_of Numeric
    end
  end
end

describe Person do
  before :each do
    @person = Person.new(17, 'rose', false)
  end

  describe '#new' do
    it 'Has name as rose' do
      expect(@person.name).to eq 'rose'
    end

    it 'Has age of 17' do
      expect(@person.age).to be 17
      expect(@person.age).to eq 17
      expect(@person.age).to eql 17
    end

    it 'Person is not possible to use a services' do
      expect(@person.can_use_services?).to be_falsey
    end

    it 'Correct_name should return the name of Person' do
      expect(@person.correct_name).to eq 'rose'
    end
  end

  describe Person do
    before :each do
      @person = Person.new(36)
    end

    it 'Initialize with age' do
      expect(@person.age).to eq 36
    end

    it 'Person should use Services' do
      expect(@person.can_use_services?).to be_truthy
      expect(@person.can_use_services?).not_to be_falsey
    end

    it 'Person rental should be initialized with 0 length' do
      expect(@person.rentals.length).to eq 0
    end

    it 'Initialize with age' do
      person = Person.new(36, 'mario')
      book = Book.new('Game of thrones', 'George Martin')
      person.add_rentals(book, '2022/08/31')
      expect(person.rentals.length).to eq 1
      expect(person.name).to eq 'mario'
      expect(book.rentals.length).to eq 1
    end
  end
end
