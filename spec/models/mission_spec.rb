require 'rails_helper'

describe Mission, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :time_in_space }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :astronauts}
  end

  describe '#sort_by_title' do
    it 'sorts the missions by title' do
      apollo_14 = Mission.create(title: "Apollo 14", time_in_space: 150)
      apollo_11 = Mission.create(title: "Apollo 11", time_in_space: 50)

      expect(Mission.sort_by_title).to eq([apollo_11, apollo_14])
    end
  end

  describe '#total_time_in_space' do
    it 'can calculate the total time in space' do
      apollo_14 = Mission.create(title: "Apollo 14", time_in_space: 150)
      apollo_11 = Mission.create(title: "Apollo 11", time_in_space: 50)

      expect(Mission.total_time_in_space).to eq(200)
    end
  end
end
