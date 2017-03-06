class CreateApprovals < ActiveRecord::Migration[5.0]
  def change
    create_table :approvals do |t|
      t.references :user, index: true, foreign_key: true
      t.integer    :approver_id, index: true
      t.timestamps
    end
      add_foreign_key :approvals, :users, column: :approver_id
  end
end
