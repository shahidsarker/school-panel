class Instructor < ApplicationRecord
  has_many :cohorts
  has_many :courses, through: :cohorts

  # enum education: {
  #     1:'High School',
  #     2:"Bachelor's",
  #     3:"Master's",
  #     4:"PhD"
  # }

  enum education: {
      high_school:1,
      bachelors:2,
      masters:3,
      phd:4
  }

  EDUCATION_MAP = {
      high_school: 'High School',
      bachelors: 'Bachelor\'s',
      masters: 'Master\'s',
      phd: 'PhD'
  }.freeze

  validates :first_name, :last_name, presence: true
  # validates :age
  validates :salary, numericality: {only_integer: true, greater_than: 0}
  # validates :education, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 4}
  validates :education, :inclusion => {:in => EDUCATION_MAP.keys.map(&:to_s)}

  # validates :education, :inclusion => {:in => EDUCATION_MAP.keys.map { |k| k.to_s } }


  def full_name
    "#{first_name} #{last_name}"
  end

  def education_label
    EDUCATION_MAP[education.to_sym]
  end
end
