require("sinatra")
require("sinatra/reloader")
require("./lib/task")
require("./lib/list")
also_reload("lib/**/*.rb")
require("pg")

DB = PG.connect({:dbname => "to_do"})

get("/") do
  erb(:index)
end

get("/lists/new") do
  erb(:lists_form)
end

post("/lists") do
  name = params.fetch("name")
  list = List.new(:name => name, :id => nil)
  list.save()
  erb(:list_success)
end

post("/tasks") do
  description = params.fetch("description")
  list_id = params.fetch("list_id").to_i()
  due = params.fetch("due")
  task = Task.new(:description => description, :list_id => list_id, :due => due, :id => nil)
  task.save()
  erb(:success)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

get("/lists/:id") do
  @list = List.find(params.fetch("id").to_i())
  erb(:list)
end


get("/delete_task/:id") do
  task = Task.find(params.fetch("id").to_i())
  task.delete()
  erb(:index)
end
