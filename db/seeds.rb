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

a = User.create(first_name: 'John', last_name: 'Smith', email: 'one@test.com', description: 'Test One')
b = User.create(first_name: 'Jane', last_name: 'Smith', email: 'two@test.com', description: 'Test Two')

a.skills.create(name: 'Ruby')
b.skills.create(name: 'Python')

c = Project.create(name: 'Test Project', user: a)
d = Project.create(name: 'Test Project Two', user: b)

# UserProject.create(project: c, requester: a)
# UserProject.create(project: d, developer: a, requester: b)
