class Student < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :cohorts, through: :enrollments


  validates :first_name, :last_name, presence: true
  validates :avatar, presence: true

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

  def years
    now = Time.now.utc.to_date
    now.year - age.year - ((now.month > age.month || (now.month == age.month && now.day >= age.day)) ? 0 : 1)
  end

end
