# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

student = Student.create(
	first_name: 'Jithya',
	last_name: 'Mukund',
	email: 'jithyamukund@gmail.com'
	)

Student.all.each do |student|
	student.blogs.create(title: "dummy blog for #{student.id}",content: 'custom content pending')
end

Course.create(name: 'rails bootcamp', description: 'pending')
Course.create(name: 'html', description: 'pending')
Course.create(name: 'css', description: 'pending')
Course.create(name: 'ruby', description: 'pending')