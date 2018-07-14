require('sinatra')
require("sinatra/reloader")
also_reload('lib/**/*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pg')
require('pry')

DB = PG.connect({:dbname => 'volunteer_tracker_test'})

get('/') do
  @projects = Project.all
  erb(:index)
end

post('/') do
  title = params["title"]
  new_project = Project.new({:id => nil, :title => title})
  new_project.save
  @projects = Project.all
  erb(:index)
end

get('/project/:id') do
  id = params[:id].to_i
  @project = Project.find(id)
  @projects = Project.all
  erb(:manage_project)
end

get('/project/edit/:id') do
  id = params[:id].to_i
  binding.pry
  @project = Project.find(id)
  @projects = Project.all
  erb(:edit_project)
end

patch('/project/edit/:id') do
  @projects = Project.all
  new_title = params["update_project"]
  id = params[:id].to_i
  @project = Project.find(id)
  @project.update({:title => new_title})
  update_title = params["update_project"]
  @projects = Project.all
  erb(:manage_project)
end
