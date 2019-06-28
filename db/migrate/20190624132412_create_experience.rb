class CreateExperience < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.belongs_to :user
      t.string :name
      t.timestamp :start
      t.timestamp :end
      t.text :description
    end
  end
end
