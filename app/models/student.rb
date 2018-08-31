class Student < ApplicationRecord
  has_many :enrollments
  has_many :cohorts, through: :enrollments

  validates :first_name, :last_name, presence: true
  # validates :age, numericality: { only_integer: true, greater_than: 0,
  #                                 less_than: 150 }
  # validates :avatar
  def full_name
      "#{first_name} #{last_name}"
    end
end
