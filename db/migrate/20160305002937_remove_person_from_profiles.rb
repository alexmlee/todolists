class RemovePersonFromProfiles < ActiveRecord::Migration
  def change
  	remove_reference :profiles, :person, index: true, foreign_key: true
  	remove_reference :todo_lists, :person, index: true, foreign_key: true
  	add_reference :profiles, :user, index: true, foreign_key: true
  	add_reference :todo_lists, :user, index: true, foreign_key: true
  end
end
