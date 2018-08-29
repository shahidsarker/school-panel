class ChangeInstructorAgeDatatype < ActiveRecord::Migration[5.2]
  def change
    remove_column :instructors, :age
    add_column :instructors, :age, :datetime
  end
end
