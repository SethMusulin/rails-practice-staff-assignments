class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.belongs_to :person
      t.belongs_to :location
      t.timestamps
    end
  end
end
