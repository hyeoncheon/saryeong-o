class CreateKissTasks < ActiveRecord::Migration
  def change
    create_table :kiss_tasks do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.text :script, null: false

      t.timestamps
    end
  end
end
