class CreateStatusProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :status_projects do |t|
      t.string :status

      t.timestamps
    end
  end
end
