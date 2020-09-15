class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :actor_id
      t.string :notification_type
      t.integer :target_id
      t.string :target_type

      t.timestamps
    end
  end
end
