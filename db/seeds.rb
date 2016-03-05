# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Profile.destroy_all

User.create! [
	{username: "Fiorina", password_digest: "qwer1234"} ,
	{username: "Trump", password_digest: "qwer1234" }, 
	{username: "Carson", password_digest: "qwer1234"}, 
	{username: "Clinton", password_digest: "qwer1234"}
]
profiles = [
 	{first_name: "Carly", last_name: "Fiorina", birth_year: "1954", gender: "female"},
	{first_name: "Donald", last_name: "Trump", birth_year: "1946", gender: "male"},
	{first_name: "Ben", last_name: "Carson", birth_year: "1951", gender: "male"},
 	{first_name: "Hillary", last_name: "Clinton", birth_year: "1947", gender: "female"}
]

user_num = 1
due_date = Date.today + 1.year
User.all.to_a.each do |user|
	user.create_profile(profiles[user_num -1])
	1.times do TodoList.create(list_name: "list #{user_num}", list_due_date: due_date, user: user)
	end
	5.times do |i| TodoItem.create(due_date: due_date, title: "item #{i + 5*(user_num-1)}", description: "text", todo_list: TodoList.find_by(user: user))
	end
	user_num += 1
end
