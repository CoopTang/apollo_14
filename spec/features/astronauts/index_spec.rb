require 'rails_helper'

RSpec.describe 'Index Spec' do
  describe 'As a visitor' do 
    it 'shows a list of astronauts with all their information' do
      neil  = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      bob   = Astronaut.create(name: "Bob Joe", age: 20, job: "Janitor")
      frank = Astronaut.create(name: "Frank Sinatra", age: 33, job: "System Administrator")

      apollo_14 = neil.missions.create(title: "Apollo 14", time_in_space: 150)
      apollo_11 = neil.missions.create(title: "Apollo 11", time_in_space: 50)

      visit '/astronauts'

      within "#astronaut-#{neil.id}" do
        expect(page).to have_content("Name: #{neil.name}")
        expect(page).to have_content("Age: #{neil.age}")
        expect(page).to have_content("Job: #{neil.job}")
        expect(page).to have_content("Total Time in Space: 200")
      end
      
      within "#astronaut-#{bob.id}" do
        expect(page).to have_content("Name: #{bob.name}")
        expect(page).to have_content("Age: #{bob.age}")
        expect(page).to have_content("Job: #{bob.job}")
        expect(page).to have_content("Total Time in Space: 0")
      end

      within "#astronaut-#{frank.id}" do
        expect(page).to have_content("Name: #{frank.name}")
        expect(page).to have_content("Age: #{frank.age}")
        expect(page).to have_content("Job: #{frank.job}")
        expect(page).to have_content("Total Time in Space: 0")
      end
    end

    it 'shows the average of all astronauts age' do
      neil  = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      bob   = Astronaut.create(name: "Bob Joe", age: 20, job: "Janitor")
      frank = Astronaut.create(name: "Frank Sinatra", age: 33, job: "System Administrator")

      visit '/astronauts'

      expect(page).to have_content("Average Age: 30")
    end

    it 'lists all of the missions in alphabetical order' do
      neil  = Astronaut.create(name: "Neil Armstrong", age: 37, job: "Commander")
      bob   = Astronaut.create(name: "Bob Joe", age: 20, job: "Janitor")
      frank = Astronaut.create(name: "Frank Sinatra", age: 33, job: "System Administrator")
      
      apollo_14 = neil.missions.create(title: "Apollo 14", time_in_space: 150)
      apollo_11 = neil.missions.create(title: "Apollo 11", time_in_space: 50)

      visit '/astronauts'

      within "#astronaut-#{neil.id}" do
        expect(page).to have_content("Missions:\n#{apollo_11.title}\n#{apollo_14.title}")
      end
    end
  end
end

