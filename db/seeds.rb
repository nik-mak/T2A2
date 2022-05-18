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
a = User.create!(first_name: 'Christopher', last_name: 'Eccleston', email: 'one@test.com', password: 'test123', description: 'Test One')
b = User.create!(first_name: 'David', last_name: 'Tennant', email: 'two@test.com', password: 'test123', description: 'Test Two')
c = User.create!(first_name: 'Matt', last_name: 'Smith', email: 'three@test.com', password: 'test123', description: 'Test Three')
d = User.create!(first_name: 'Peter', last_name: 'Capaldi', email: 'four@test.com', password: 'test123', description: 'Test Four')
e = User.create!(first_name: 'Jodie', last_name: 'Whittaker', email: 'five@test.com', password: 'test123', description: 'Test Five')

# Skills
# Skill.create!(name: 'C')
Skill.create!(name: 'Python')
# Skill.create!(name: 'Java')
# Skill.create!(name: 'C++')
# Skill.create!(name: 'C#')
Skill.create!(name: 'JavaScript')
# Skill.create!(name: 'PHP')
Skill.create!(name: 'SQL')
# Skill.create!(name: 'Groovy')
# Skill.create!(name: 'R')
Skill.create!(name: 'Ruby')
# Skill.create!(name: 'Swift')
# Skill.create!(name: 'Matlab')
Skill.create!(name: 'Golang')
# Skill.create!(name: 'Objective-C')
# Skill.create!(name: 'Kotlin')
# Skill.create!(name: 'TypeScript')
Skill.create!(name: 'Rails')
Skill.create!(name: 'React')
# Skill.create!(name: 'Vue')
# Skill.create!(name: 'Django')
# Skill.create!(name: 'Angular')
# Skill.create!(name: 'Laravel')
# Skill.create!(name: 'ASP.NET')
# Skill.create!(name: 'Express')
# Skill.create!(name: 'Spring')
# Skill.create!(name: 'Ember')
# Skill.create!(name: 'Meteor')

# UserSkills
Skill.first.users<<a<<b<<c
Skill.second.users<<b<<c<<d
Skill.third.users<<c<<d<<e
Skill.fourth.users<<d<<e<<a
Skill.fifth.users<<b<<c<<e

# Projects
Project.create!(name: 'Calculator', description: 'Calculator app I made',user: a)
Project.create!(name: 'Marketplace App', description: 'Marketplace app I made',user: d)
Project.create!(name: 'Terminal App', description: 'Terminal app I made', user: b)

# UserProjects
Project.first.users<<b<<c
Project.second.users<<b<<e
Project.third.users<<b<<a<<d<<e

puts "Users: #{User.count}"
puts "Skills: #{Skill.count}"
puts "Projects: #{Project.count}"


