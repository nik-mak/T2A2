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
a = User.create!(first_name: 'Russel', last_name: 'Sprout', email: 'one@test.com', password: 'test123', description: 'Test One', developer: true)
b = User.create!(first_name: 'Fletch', last_name: 'Skinner', email: 'two@test.com', password: 'test123', description: 'Test Two', developer: true)
c = User.create!(first_name: 'Burgundy', last_name: 'Flemming', email: 'three@test.com', password: 'test123', description: 'Test Three', developer: true)
d = User.create!(first_name: 'Nelson', last_name: 'Fig', email: 'four@test.com', password: 'test123', description: 'Test Four', developer: true)
e = User.create!(first_name: 'Ursula', last_name: 'Gurnmeister', email: 'five@test.com', password: 'test123', description: 'Test Five', developer: true)
f = User.create!(first_name: 'Cecil', last_name: 'Smith', email: 'six@test.com', password: 'test123', description: 'Test Six', developer: false)
g = User.create!(first_name: 'Miles', last_name: 'Tone', email: 'seven@test.com', password: 'test123', description: 'Test Seven', developer: false)
h = User.create!(first_name: 'Linguina', last_name: 'Nettlewater', email: 'eight@test.com', password: 'test123', description: 'Test Eight', developer: false)

# Admin user
a.add_role :admin

# Skills
Skill.create!(name: 'C')
Skill.create!(name: 'Python')
Skill.create!(name: 'Java')
Skill.create!(name: 'C++')
Skill.create!(name: 'C#')
Skill.create!(name: 'JavaScript')
Skill.create!(name: 'PHP')
Skill.create!(name: 'SQL')
Skill.create!(name: 'Groovy')
Skill.create!(name: 'Ruby')
Skill.create!(name: 'Swift')
Skill.create!(name: 'Golang')
Skill.create!(name: 'Objective-C')
Skill.create!(name: 'Kotlin')
Skill.create!(name: 'TypeScript')
Skill.create!(name: 'Rails')
Skill.create!(name: 'React')
Skill.create!(name: 'Vue')
Skill.create!(name: 'Django')
Skill.create!(name: 'Angular')


# UserSkills
Skill.first.users<<a<<b<<c
Skill.second.users<<b<<c<<d
Skill.third.users<<c<<d<<e
Skill.fourth.users<<d<<e<<a
Skill.fifth.users<<b<<c<<e

# Projects
Project.create!(name: 'Calculator', description: 'Simple calculator',user: a)
Project.create!(name: 'Marketplace App', description: 'Two-sided marketplace app',user: b)
Project.create!(name: 'Terminal App', description: 'Simple terminal application', user: c)
Project.create!(name: 'URL Shortener', description: 'Shortens a URL', user: f)
Project.create!(name: 'Tic-tac-toe', description: 'Tic-tac-toe game', user: h)

# UserProjects
Project.first.users<<b<<c
Project.second.users<<b<<e<<a
Project.third.users<<b<<a<<d<<e

puts "Users: #{User.count}"
puts "Skills: #{Skill.count}"
puts "Projects: #{Project.count}"


