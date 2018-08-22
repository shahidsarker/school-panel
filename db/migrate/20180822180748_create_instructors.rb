class CreateInstructors < ActiveRecord::Migration[5.2]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :salary
      t.integer :education
      t.string :avatar
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
