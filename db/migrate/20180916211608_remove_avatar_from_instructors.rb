class RemoveAvatarFromInstructors < ActiveRecord::Migration[5.2]
  def change
    remove_column :instructors, :avatar, :string
  end
end
