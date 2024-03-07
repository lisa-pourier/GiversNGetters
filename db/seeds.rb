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
UserExpertise.destroy_all
UserInterest.destroy_all
Request.destroy_all
User.destroy_all
Expertise.destroy_all


puts 'Creating users...'
lisa_pourier = User.new(username: "Lisa Pourier", email: "lisapourier@gmail.com", password: "123456", about_me: "I am a sunny person who loves to help people in any way I can.
  Sometimes I need to help too,
  it used to be difficult to ask,
  but over the years I have learned to ask for help when I need it.
  My interest include Trading & Investing, better understanding myself and learning to code.")
lisa_pourier.save!

dogus_akyuz = User.new(username: "Dogus Akyuz", email: "av.dogusakyuz@gmail.com", password: "123456", about_me: "My name is Dogus.
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

household = Expertise.create(name: "Household")
personal_development = Expertise.create(name: "Personal Development")
finance = Expertise.create(name: "Finance")



UserExpertise.create(user: lisa_pourier, expertise: household)
UserExpertise.create(user: lisa_pourier, expertise: personal_development)

UserInterest.create(user: lisa_pourier, expertise: finance)


puts 'Finished!'
