class Student < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :cohorts, through: :enrollments

  validates :first_name, :last_name, presence: true
  # validates :age, numericality: { only_integer: true, greater_than: 0,
  #                                 less_than: 150 }
  # validates :avatar

  def full_name
      "#{first_name} #{last_name}"
  end

  def years
    now = Time.now.utc.to_date
    now.year - age.year - ((now.month > age.month || (now.month == age.month && now.day >= age.day)) ? 0 : 1)
  end

end
