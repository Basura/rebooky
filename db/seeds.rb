# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create_with(email: 'guilleva@gmail.com',
                 password: 'changeme!',
                 password_confirmation: 'changeme!',
                 first_name: 'Guillermo',
                 last_name: 'Vargas',
                 role: 'admin')
    .find_or_create_by(email: 'guilleva@gmail.com')

PeakSeason.find_or_create_by(name: 'Summer')
PeakSeason.find_or_create_by(name: 'Spring')
PeakSeason.find_or_create_by(name: 'Winter')
PeakSeason.find_or_create_by(name: 'Autumn')
