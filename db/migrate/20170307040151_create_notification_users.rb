class CreateNotificationUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :notification, index: true, foreign_key: true

      t.timestamps
    end
  end
end
