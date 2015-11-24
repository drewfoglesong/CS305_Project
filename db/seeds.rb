# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Teacher.create(name: "Hello", password: "World", password_confirmation: "World", admin: false)
Teacher.create(name: "q", password: "q", password_confirmation: "q", admin: false)
Teacher.create(name: "Drew", password: "cs305", password_confirmation: "cs305", admin: true)
