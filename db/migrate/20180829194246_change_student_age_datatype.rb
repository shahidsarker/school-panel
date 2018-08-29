class ChangeStudentAgeDatatype < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :age
    add_column :students, :age, :datetime
  end
end
