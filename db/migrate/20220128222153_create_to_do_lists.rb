class CreateToDoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :to_do_lists do |t|
      t.string :priority
      t.boolean :done
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
