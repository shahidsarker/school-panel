class Instructor < ApplicationRecord
  has_many :cohorts
  has_many :courses, through: :cohorts

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

  def years
    now = Time.now.utc.to_date
    now.year - age.year - ((now.month > age.month || (now.month == age.month && now.day >= age.day)) ? 0 : 1)
  end
end
