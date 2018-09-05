class Course < ApplicationRecord
  has_many :cohorts, dependent: :destroy
  has_many :instructors, through: :cohorts

  validates :name, presence: true
  validates :hours, numericality: { greater_than_or_equal_to: 0 }

  def total_students
    sum = 0
    self.cohorts.each do |cohort|
      sum += cohort.students.length
    end
    sum
  end
end