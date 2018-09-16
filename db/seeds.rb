# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
require 'httparty'
require 'json'
I18n.reload!


lorem = Faker::Lorem

lflick = Faker::LoremFlickr


tinyfaces_response = HTTParty.get('https://tinyfac.es/api/users')

people = []
tinyfaces_response.each do |x|
  person = [
      x['avatars'][1]['url'],
      x['first_name'],
      x['last_name']
  ]
  people.push(person)
end

puts 'people array created'

puts 'adding courses'
courses = Course.create!([
                             {name: Faker::Educator.university, hours: rand(1..40)},

                             {name: Faker::Educator.university, hours: rand(1..40)}])

puts 'adding instructors'
instructors = []
4.times do |x|
  popped_person = people.pop
  puts 'popped person'
  instructor = Instructor.create!(first_name: popped_person[1],
                                 last_name: popped_person[2],
                                 salary: rand(1..100) * 1000,
                                 education: rand(1..4),
                                 age: Faker::Date.birthday(18, 65)
  )
  puts 'created instructor'
  filename = open(popped_person[0])
  instructor.photo.attach(io: filename,
                          filename: popped_person[0].sub('https://tinyfac.es/data/avatars/', '')
  )
  puts 'attached photo to instructor'
  instructors.push(instructor)
  puts 'pushed instructor to instructors array'
end

puts 'adding cohorts'
cohorts = Cohort.create!([{name: Faker::Lorem.word,
                           start: Faker::Time.between(DateTime.now - 45, DateTime.now - 30),
                           end: Faker::Time.between(DateTime.now - 30, DateTime.now),
                           instructor: instructors.sample,
                           course: courses.sample},
                          {name: Faker::Lorem.word,
                           start: Faker::Time.between(DateTime.now - 45, DateTime.now - 30),
                           end: Faker::Time.between(DateTime.now - 30, DateTime.now),
                           instructor: instructors.sample,
                           course: courses.sample},
                          {name: Faker::Lorem.word,
                           start: Faker::Time.between(DateTime.now - 45, DateTime.now - 30),
                           end: Faker::Time.between(DateTime.now - 30, DateTime.now),
                           instructor: instructors.sample,
                           course: courses.sample}
                         ])


puts 'adding students'
students = []
(people.length - 4).times do |x|
  popped_person = people.pop
  puts 'popped person'
  student = Student.create!(first_name: popped_person[1],
                            last_name: popped_person[2],
                            age: Faker::Date.birthday(18, 65)
  )
  puts 'created instructor'
  filename = open(popped_person[0])
  student.photo.attach(io: filename,
                       filename: popped_person[0].sub('https://tinyfac.es/data/avatars/', '')
  )
  puts 'attached photo to student'
  students.push(student)
  puts 'pushed student to students array'
end

puts 'adding enrollments'

enrollments = Enrollment.create!([{student: students.sample,
                                   cohort: cohorts.sample},
                                  {student: students.sample,
                                   cohort: cohorts.sample},
                                  {student: students.sample,
                                   cohort: cohorts.sample},
                                  {student: students.sample,
                                   cohort: cohorts.sample},
                                  {student: students.sample,
                                   cohort: cohorts.sample},
                                  {student: students.sample,
                                   cohort: cohorts.sample},
                                  {student: students.sample,
                                   cohort: cohorts.sample},
                                  {student: students.sample,
                                   cohort: cohorts.sample}
                                 ])