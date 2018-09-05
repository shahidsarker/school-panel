# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
I18n.reload!

# date = DateTime.new(2009,9,1,17)

lorem = Faker::Lorem

lflick = Faker::LoremFlickr


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

instructors = Instructor.create!([{first_name: Faker::Name.first_name,
                                   last_name: Faker::Name.last_name,
                                   salary: rand(100) * 1000,
                                   education: rand(1..4),
                                   avatar: lflick.image,
                                   age: Faker::Date.birthday(18, 65)},
                                  {first_name: Faker::Name.first_name,
                                   last_name: Faker::Name.last_name,
                                   salary: rand(100) * 1000,
                                   education: rand(1..4),
                                   avatar: lflick.image,
                                   age: Faker::Date.birthday(18, 65)},
                                  {first_name: Faker::Name.first_name,
                                   last_name: Faker::Name.last_name,
                                   salary: rand(100) * 1000,
                                   education: rand(1..4),
                                   avatar: lflick.image,
                                   age: Faker::Date.birthday(18, 65)},
                                  {first_name: Faker::Name.first_name,
                                   last_name: Faker::Name.last_name,
                                   salary: rand(100) * 1000,
                                   education: rand(1..4),
                                   avatar: lflick.image,
                                   age: Faker::Date.birthday(18, 65)}])

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