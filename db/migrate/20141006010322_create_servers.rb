class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :hostname, null: false
      t.string :os
      t.string :arch
      t.string :version
      t.string :uuid

      t.timestamps
    end
    add_index :servers, :uuid, unique: true
  end
end
