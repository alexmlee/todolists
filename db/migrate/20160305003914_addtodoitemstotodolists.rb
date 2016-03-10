class Addtodoitemstotodolists < ActiveRecord::Migration
  def change
  	remove_reference :todo_lists, :todo_list, index: true, foreign_key: true
  	add_reference :todo_items, :todo_list, index: true, foreign_key: true
  end
end
