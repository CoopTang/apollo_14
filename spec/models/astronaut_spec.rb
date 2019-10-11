require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe '#average_age' do
    it 'can calculate the average age of a group of astronauts' do
      neil  = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      bob   = Astronaut.create(name: "Bob Joe", age: 20, job: "Janitor")
      frank = Astronaut.create(name: "Frank Sinatra", age: 33, job: "System Administrator")

      expect(Astronaut.all.average_age).to eq(30)
    end
  end
end
