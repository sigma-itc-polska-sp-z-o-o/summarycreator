class CreateEducation < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.belongs_to :user
      t.string :school
      t.string :specialization
      t.timestamp :start
      t.timestamp :end
      t.string :degree
    end
  end
end
