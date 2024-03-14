# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
Agreement.destroy_all
Message.destroy_all
UserExpertise.destroy_all
Request.destroy_all
UserInterest.destroy_all
User.destroy_all
Expertise.destroy_all

# All the Users
puts 'Creating users...'
lisa_pourier = User.new(username: "Lisa Pourier", email: "lisapourier@gmail.com", password: "123456", about_me: "I am a sunny person who loves to help people in any way I can.
  Sometimes I need to help too,
  it used to be difficult to ask,
  but over the years I have learned to ask for help when I need it.
  My interest include Trading & Investing, better understanding myself and learning to code.")
lisa_pourier.save!

dogus_akyuz = User.new(username: "Dogus  Akyuz", email: "av.dogusakyuz@gmail.com", password: "123456", about_me: "My name is Dogus.
  I'm living in the Netherlands for one year.
  My interests are history, video-games and football.
  I've been working as a legal counsel for 15 years but then I decided to become a software developer.
  I'm also looking for someone to teach me Dutch A1.")
dogus_akyuz.save!

robertomaria_ferrara = User.new(username: "Robertomaria Ferrara", email: "robyorke95@gmail.com", password: "123456", about_me: "My name is Rob,
  I am an Italian expat living in the Nederland for over a decade,
  My interest are computer tech, music and video-games,
  I've been working as a cook for most of my life and recently I've decided to study programming")
robertomaria_ferrara.save!

# All the Expertises
interior_design = Expertise.create(name: "Interior Design")
personal_development = Expertise.create(name: "Personal Development")
finance = Expertise.create(name: "Finance")
history = Expertise.create(name: "History")
theatre = Expertise.create(name: "Theatre")
languages = Expertise.create(name: "Languages")
coding = Expertise.create(name: "Coding")
computer_hardware = Expertise.create(name: "Computer Hardware")
music = Expertise.create(name: "Music")
gaming = Expertise.create(name: "Gaming")

# Lisa Expertise & Interests
UserExpertise.create(user: lisa_pourier, expertise: interior_design)
UserExpertise.create(user: lisa_pourier, expertise: personal_development)

UserInterest.create(user: lisa_pourier, expertise: finance)
UserInterest.create(user: lisa_pourier, expertise: interior_design)
UserInterest.create(user: lisa_pourier, expertise: coding)

# Dogus Expertise & Interests
# expertise: history, theatre
# interest: languages, history, coding
UserExpertise.create(user: dogus_akyuz, expertise: history)
UserExpertise.create(user: dogus_akyuz, expertise: theatre)
UserExpertise.create(user: dogus_akyuz, expertise: coding)

UserInterest.create(user: dogus_akyuz, expertise: languages)
UserInterest.create(user: dogus_akyuz, expertise: history)
UserInterest.create(user: dogus_akyuz, expertise: coding)

# Rob Expertise & Interests
# expertise: computer hardware, coding , music, gaming
# interest: computer hardware, coding , music, gaming
UserExpertise.create(user: robertomaria_ferrara, expertise: computer_hardware)
UserExpertise.create(user: robertomaria_ferrara, expertise: coding)
UserExpertise.create(user: robertomaria_ferrara, expertise: music)
UserExpertise.create(user: robertomaria_ferrara, expertise: gaming)

UserInterest.create(user: robertomaria_ferrara, expertise: computer_hardware)
UserInterest.create(user: robertomaria_ferrara, expertise: coding)
UserInterest.create(user: robertomaria_ferrara, expertise: music)
UserInterest.create(user: robertomaria_ferrara, expertise: gaming)

# User Requests
# Request.create(user: lisa_pourier, expertise: interior_design, title: "Looking for a mentor in interior design", description: "I am looking for help", status: false)
# Request.create(user: dogus_akyuz, expertise: coding, title: "Looking for a mentor in coding", description: "I am looking for help", status: false)

puts 'Finished!'
