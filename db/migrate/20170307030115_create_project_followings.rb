class CreateProjectFollowings < ActiveRecord::Migration[5.0]
  def change
    create_table :project_followings do |t|
      t.references :follower, index: true
      t.references :following_project, index: true
      t.timestamps
    end
    add_foreign_key :project_followings, :users, column: :follower_id
    add_foreign_key :project_followings, :projects, column: :following_project_id
  end
end
