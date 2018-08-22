class Course < ApplicationRecord
  has_many :cohorts
  has_many :instructors, through: :cohorts

  validates :name, presence: true
  validates :hours, numericality: { greater_than_or_equal_to: 0 }
end
