class Cohort < ApplicationRecord
  belongs_to :instructor
  belongs_to :course
  has_many :enrollments
  has_many :students, through: :enrollments

  validates :name, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :instructor_id, presence: true
  validates :course_id, presence: true
end
