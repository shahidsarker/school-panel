class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :avatar
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
