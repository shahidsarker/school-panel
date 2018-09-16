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

# x = Instructor.create(first_name:'Shahid', last_name:'Sarker',salary: 60_000, education: 2, avatar: 'http://example.com/exam.jpg',           age: DateTime.now)
#
# pp x
#
# y = Student.create(first_name: Faker::Name.first_name,
#                              last_name: Faker::Name.last_name,
#                              avatar: lflick.image,
#                              age: DateTime.new(2009,9,1,17) )
# pp y
#
# instructors = Instructor.create!([{first_name: Faker::Name.first_name,
#                                    last_name: Faker::Name.last_name,
#                                    salary: rand(100) * 1000,
#                                    education: rand(1..4),
#                                    avatar: lflick.image,
#                                    age: Faker::Date.birthday(18, 65)},
#                                   {first_name: Faker::Name.first_name,
#                                    last_name: Faker::Name.last_name,
#                                    salary: rand(100) * 1000,
#                                    education: rand(1..4),
#                                    avatar: lflick.image,
#                                    age: Faker::Date.birthday(18, 65)},
#                                   {first_name: Faker::Name.first_name,
#                                    last_name: Faker::Name.last_name,
#                                    salary: rand(100) * 1000,
#                                    education: rand(1..4),
#                                    avatar: lflick.image,
#                                    age: Faker::Date.birthday(18, 65)},
#                                   {first_name: Faker::Name.first_name,
#                                    last_name: Faker::Name.last_name,
#                                    salary: rand(100) * 1000,
#                                    education: rand(1..4),
#                                    avatar: lflick.image,
#                                    age: Faker::Date.birthday(18, 65)}])

instructors = []


# 4.times do |x|
#   instructor = Instructor.create!(first_name: Faker::Name.first_name,
#                                   last_name: Faker::Name.last_name,
#                                   salary: rand(1..100) * 1000,
#                                   education: rand(1..4),
#                                   avatar: lflick.image,
#                                   age: Faker::Date.birthday(18, 65)
#   )
#   pp instructor
#
#   instructors.push(instructor)
# end



4.times do |x|
  popped_person = people.pop
  puts 'popped person'
  instructor = Instructor.create!(first_name: popped_person[1],
                                 last_name: popped_person[2],
                                 salary: rand(1..100) * 1000,
                                 education: rand(1..4),
                                 avatar: nil,
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
students = Student.create!([{first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             avatar: lflick.image,
                             age: Faker::Date.birthday(18, 65)},
                            {first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             avatar: lflick.image,
                             age: Faker::Date.birthday(18, 65)},
                            {first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             avatar: lflick.image,
                             age: Faker::Date.birthday(18, 65)},
                            {first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             avatar: lflick.image,
                             age: Faker::Date.birthday(18, 65)},
                            {first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             avatar: lflick.image,
                             age: Faker::Date.birthday(18, 65)},
                            {first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             avatar: lflick.image,
                             age: Faker::Date.birthday(18, 65)},
                            {first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             avatar: lflick.image,
                             age: Faker::Date.birthday(18, 65)},
                            {first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             avatar: lflick.image,
                             age: Faker::Date.birthday(18, 65)},
                            {first_name: Faker::Name.first_name,
                             last_name: Faker::Name.last_name,
                             avatar: lflick.image,
                             age: Faker::Date.birthday(18, 65)}])

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