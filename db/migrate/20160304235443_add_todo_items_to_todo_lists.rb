class AddTodoItemsToTodoLists < ActiveRecord::Migration
  def change
    add_reference :todo_lists, :todo_list, index: true, foreign_key: true
  end
end
