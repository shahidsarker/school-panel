class Instructor < ApplicationRecord
  has_many :cohorts
  has_many :courses, through: :cohorts
  # enum education: [' ','High School', "Bachelor's", "Master's", "PhD"]

  enum education: {'High School':1, "Bachelor's":2, "Master's":3, "PhD":4}

  validates :first_name, :last_name, presence: true
  validates :age, numericality: {only_integer: true,greater_than: 0,less_than: 150}
  validates :salary, numericality: {only_integer: true, greater_than: 0}
  validates :education, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4}

  def full_name
    "#{first_name} #{last_name}"
  end

  # def edu_level(input=self.education)
  #   education_levels = ['High School', "Bachelor's", "Master's", "PhD"]
  #   education_levels[input-1]
  # end
end
