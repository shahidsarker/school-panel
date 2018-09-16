class RemoveAvatarFromStudents < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :avatar, :string
  end
end
