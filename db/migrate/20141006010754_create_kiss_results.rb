class CreateKissResults < ActiveRecord::Migration
  def change
    create_table :kiss_results do |t|
      t.integer :status, default: 999
      t.text :output
      t.text :error
      t.references :kiss_task, index: true
      t.references :server, index: true

      t.timestamps
    end
  end
end
