class CreateProjectPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :project_photos do |t|
      t.string :photo_url
      t.string :type
      t.references :project, index: true, foreign_key: true
      t.timestamps
    end
  end
end
