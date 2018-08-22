class Instructor < ApplicationRecord
  has_many :cohorts
  has_many :courses, through: :cohorts

  validates :first_name, :last_name, presence: true
  validates :age, numericality: {only_integer: true,greater_than: 0,less_than: 150}
  validates :salary, numericality: {only_integer: true, greater_than: 0}
  validates :education, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4}

end
