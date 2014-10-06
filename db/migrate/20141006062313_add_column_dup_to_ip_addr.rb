class AddColumnDupToIpAddr < ActiveRecord::Migration
  def change
    add_column :ip_addrs, :dup, :boolean, default: false
  end
end
