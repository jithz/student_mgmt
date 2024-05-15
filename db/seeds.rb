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

FrontEndSkill.find_or_create_by(name: 'HTML')
FrontEndSkill.find_or_create_by(name: 'CSS3')
FrontEndSkill.find_or_create_by(name: 'JavaScript')
FrontEndSkill.find_or_create_by(name: 'jQuery')
FrontEndSkill.find_or_create_by(name: 'Angular JS')
FrontEndSkill.find_or_create_by(name: 'React JS')
FrontEndSkill.find_or_create_by(name: 'Vue JS')

BackEndSkill.find_or_create_by(name: 'Ruby')
BackEndSkill.find_or_create_by(name: 'Rails')
BackEndSkill.find_or_create_by(name: 'JAVA')
BackEndSkill.find_or_create_by(name: 'Python')
BackEndSkill.find_or_create_by(name: 'Node JS')
BackEndSkill.find_or_create_by(name: 'MySQL')
BackEndSkill.find_or_create_by(name: 'REST Api')
BackEndSkill.find_or_create_by(name: 'MongoDB')

StudentSkill.create(student: Student.first, skill: Skill.find(1), rating: 8 )
StudentSkill.create(student: Student.first, skill: Skill.find(2), rating: 8 )
StudentSkill.create(student: Student.first, skill: Skill.find(3), rating: 8 )
StudentSkill.create(student: Student.first, skill: Skill.find(10), rating: 8 )
StudentSkill.create(student: Student.first, skill: Skill.find(14), rating: 8 )
StudentSkill.create(student: Student.first, skill: Skill.find(13), rating: 8 )
StudentSkill.create(student: Student.last, skill: Skill.find(1), rating: 8 )
StudentSkill.create(student: Student.last, skill: Skill.find(2), rating: 8 )
