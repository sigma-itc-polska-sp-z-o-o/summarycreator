class CreateUsersSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :users_skills do |t|
      t.belongs_to :user
      t.belongs_to :skill
      t.integer :grade
    end
  end
end
