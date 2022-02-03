class AddListToToDoList < ActiveRecord::Migration[5.2]
  def change
    add_reference :to_do_lists, :list, foreign_key: true
  end
end
