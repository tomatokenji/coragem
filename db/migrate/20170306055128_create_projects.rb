class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :skills_needed
      t.boolean :approved
      t.integer :approver_id, index: true
      t.text :benefits
      t.text :resources_needed
      t.references :user, index: true, foreign_key: true
      
      t.timestamps
    end
    add_foreign_key :projects, :users, column: :approver_id
  end
end
