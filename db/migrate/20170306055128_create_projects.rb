class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :objectives
      t.text :description
      t.text :project_scope
      t.text :talents_needed
      t.text :budget
      t.string :status
      t.string :project_profile_picture_id
      t.string :project_proposal_id
      t.references :project_approver, index: true
      t.references :project_manager, index: true
      t.references :user, index: true, foreign_key: true
      t.references :status_project, index: true, foreign_key: true
      t.timestamps
    end
    add_foreign_key :projects, :users, column: :project_approver_id
    add_foreign_key :projects, :users, column: :project_manager_id
  end
end
