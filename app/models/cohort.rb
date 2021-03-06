class Cohort < ApplicationRecord
  belongs_to :instructor
  belongs_to :course
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  validates :name, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :instructor_id, presence: true
  validates :course_id, presence: true


  def concat_name
    "#{self.course.name} - #{name}"
  end
end
