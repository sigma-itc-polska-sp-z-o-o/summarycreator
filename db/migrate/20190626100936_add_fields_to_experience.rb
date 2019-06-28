class AddFieldsToExperience < ActiveRecord::Migration[5.2]
  def change
    rename_column :experiences, :name, :company
    add_column :experiences, :role, :string
  end
end
