class CreateProjectFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :project_files do |t|
      t.string :file_url
      t.string :type
      t.references :project, index: true, foreign_key: true
      t.timestamps
    end
  end
end
