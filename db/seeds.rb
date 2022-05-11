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

a = User.create(first_name: 'Christopher', last_name: 'Eccleston', email: 'one@test.com', description: 'Test One')
b = User.create(first_name: 'David', last_name: 'Tennant', email: 'two@test.com', description: 'Test Two')
c = User.create(first_name: 'Matt', last_name: 'Smith', email: 'three@test.com', description: 'Test Three')
d = User.create(first_name: 'Peter', last_name: 'Capaldi', email: 'four@test.com', description: 'Test Four')
e = User.create(first_name: 'Jodie', last_name: 'Whittaker', email: 'five@test.com', description: 'Test Five')

a.skills.create(name: 'Ruby')
a.skills.create(name: 'Rails')
a.skills.create(name: 'HTML')
a.skills.create(name: 'CSS')
a.skills.create(name: 'Javascript')

b.skills.create(name: 'Ruby')
b.skills.create(name: 'Rails')
b.skills.create(name: 'HTML')
b.skills.create(name: 'CSS')
b.skills.create(name: 'Javascript')

c.skills.create(name: 'Ruby')
c.skills.create(name: 'Rails')
c.skills.create(name: 'HTML')
c.skills.create(name: 'CSS')
c.skills.create(name: 'Javascript')

d.skills.create(name: 'Ruby')
d.skills.create(name: 'Rails')
d.skills.create(name: 'HTML')
d.skills.create(name: 'CSS')
d.skills.create(name: 'Javascript')

e.skills.create(name: 'Ruby')
e.skills.create(name: 'Rails')
e.skills.create(name: 'HTML')
e.skills.create(name: 'CSS')
e.skills.create(name: 'Javascript')

Project.create(name: 'Calculator', user: a)
Project.create(name: 'Marketplace App', user: d)
Project.create(name: 'Terminal App', user: b)

Project.first.users<<b<<c
Project.second.users<<b<<e
Project.third.users<<b<<a<<d<<e

