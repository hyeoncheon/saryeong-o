class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :mail, null: false
      t.string :permission
      t.string :image
      t.string :siso_uid
      t.string :siso_gid
      t.boolean :siso_active
      t.datetime :last_seen

      t.timestamps
    end
    add_index :users, :mail, unique: true
  end
end
