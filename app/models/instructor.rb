class Instructor < ApplicationRecord
  has_many :cohorts, dependent: :nullify
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
  validates :salary, numericality: {only_integer: true, greater_than: 0}
  validates :education, :inclusion => {:in => EDUCATION_MAP.keys.map(&:to_s)}

  # validates :education, :inclusion => {:in => EDUCATION_MAP.keys.map { |k| k.to_s } }

  validate :age_calc
  def age_calc
    if self.age
      errors.add(:age, 'You must be 13 years or older.') if self.age > 13.years.ago.to_date
      errors.add(:age, "That's too old.") if self.age < 150.years.ago.to_date
    end
  end

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
