class CreateIpAddrs < ActiveRecord::Migration
  def change
    create_table :ip_addrs do |t|
      t.string :addr, null: false
      t.boolean :default, default: true
      t.references :server, index: true

      t.timestamps
    end
  end
end
