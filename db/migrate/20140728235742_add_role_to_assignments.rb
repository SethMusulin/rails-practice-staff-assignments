class AddRoleToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :role, :string
  end
end
