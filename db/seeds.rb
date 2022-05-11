# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Skill.destroy_all
Project.destroy_all

# Users
a = User.create!(first_name: 'Christopher', last_name: 'Eccleston', email: 'one@test.com', description: 'Test One')
b = User.create!(first_name: 'David', last_name: 'Tennant', email: 'two@test.com', description: 'Test Two')
c = User.create!(first_name: 'Matt', last_name: 'Smith', email: 'three@test.com', description: 'Test Three')
d = User.create!(first_name: 'Peter', last_name: 'Capaldi', email: 'four@test.com', description: 'Test Four')
e = User.create!(first_name: 'Jodie', last_name: 'Whittaker', email: 'five@test.com', description: 'Test Five')

# Skills
Skill.create!(name: 'Ruby')
Skill.create!(name: 'Rails')
Skill.create!(name: 'HTML')
Skill.create!(name: 'CSS')
Skill.create!(name: 'Javascript')

# UserSkills
Skill.first.users<<a<<b<<c
Skill.second.users<<b<<c<<d
Skill.third.users<<c<<d<<e
Skill.fourth.users<<d<<e<<a
Skill.fifth.users<<b<<c<<e

# Projects
Project.create!(name: 'Calculator', user: a)
Project.create!(name: 'Marketplace App', user: d)
Project.create!(name: 'Terminal App', user: b)

# UserProjects
Project.first.users<<b<<c
Project.second.users<<b<<e
Project.third.users<<b<<a<<d<<e

puts "Users: #{User.count}"
puts "Skills: #{Skill.count}"
puts "Projects: #{Project.count}"


