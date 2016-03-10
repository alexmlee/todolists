class AddPersonToTodoLists < ActiveRecord::Migration
  def change
    add_reference :todo_lists, :person, index: true, foreign_key: true
  end
end
