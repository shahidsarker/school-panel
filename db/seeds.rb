# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'


lorem = Faker::Lorem

lflick = Faker::LoremFlickr

courses = Course.create([
                            {name:Faker::Lorem.sentence,hours: rand(1..40)},

                            {name:Faker::Lorem.sentence,hours: rand(1..40)}])

instructors = Instructor.create([
                                    {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), salary:rand(60000), education:rand(1..4),avatar:lflick.image},
                                    {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), salary:rand(60000), education:rand(1..4),avatar:lflick.image},
                                    {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), salary:rand(60000), education:rand(1..4),avatar:lflick.image},
                                    {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), salary:rand(60000), education:rand(1..4),avatar:lflick.image},
                                ])

cohorts = Cohort.create([
                            {name:Faker::Lorem.word,
                             start:Faker::Time.between(DateTime.now - 45, DateTime.now - 30),
                             end:Faker::Time.between(DateTime.now - 30, DateTime.now),
                            instructor: instructors.sample,
                            course: courses.sample},
                            {name:Faker::Lorem.word,
                             start:Faker::Time.between(DateTime.now - 45, DateTime.now - 30),
                             end:Faker::Time.between(DateTime.now - 30, DateTime.now),
                             instructor: instructors.sample,
                             course: courses.sample},
                            {name:Faker::Lorem.word,
                             start:Faker::Time.between(DateTime.now - 45, DateTime.now - 30),
                             end:Faker::Time.between(DateTime.now - 30, DateTime.now),
                             instructor: instructors.sample,
                             course: courses.sample},
                        ])

students = Student.create([
                              {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), avatar:lflick.image},
                              {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), avatar:lflick.image},
                              {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), avatar:lflick.image},
                              {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), avatar:lflick.image},
                              {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), avatar:lflick.image},
                              {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), avatar:lflick.image},
                              {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), avatar:lflick.image},
                              {first_name:Faker::Name.first_name, last_name:Faker::Name.last_name, age:rand(150), avatar:lflick.image}
                          ])

enrollments = Enrollment.create([
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
    {student: students.sample,cohort: cohorts.sample},
                                ])