class CreateFollowships < ActiveRecord::Migration[5.2]
  def change
    create_table :followships do |t|
      t.integer :user_id
      t.integer :followee_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
