class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :objectives
      t.text :description
      t.text :project_scope
      t.text :talents_needed
      t.text :budget
      t.boolean :approved
      t.integer :project_approver_id, index: true
      t.integer :project_manager_id, index: true
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
    add_foreign_key :projects, :users, column: :project_approver_id
    add_foreign_key :projects, :users, column: :project_manager_id
  end
end
