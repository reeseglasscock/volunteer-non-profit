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
  @volunteers = Volunteer.all
  erb(:index)
end

post('/') do
  title = params["title"]
  name = params["name"]
  if title != nil && title != ""
    new_project = Project.new({:id => nil, :title => title})
    new_project.save
  elsif title == nil && name != nil && name != ""
    new_volunteer = Volunteer.new({:id => nil, :name => name, :project_id => 0})
    new_volunteer.save
  end
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

get('/project/:id') do
  id = params[:id].to_i
  @project = Project.find(id)
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:project_details)
end

get('/project/:id/edit') do
  id = params[:id].to_i
  @project = Project.find(id)
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:edit_project)
end

get('/volunteer/:id/edit') do
  id = params[:id].to_i
  @volunteer = Volunteer.find(id)
  @volunteers = Volunteer.all
  erb(:edit_volunteer)
end

patch('/project/:id/edit') do
  @projects = Project.all
  @volunteers = Volunteer.all
  new_title = params["update_project"]
  if new_title != nil && new_title != ""
    id = params[:id].to_i
    @project = Project.find(id)
    @project.update({:title => new_title})
  end
  @projects = Project.all
  erb(:edit_project)
end

patch('/volunteer/:id/edit') do
  @volunteers = Volunteer.all
  new_name = params["update_name"]
  if new_name != nil && new_name != ""
    id = params[:id].to_i
    @volunteer = Volunteer.find(id)
    @volunteer.update({:name => new_name})
  end
  @volunteers = Volunteer.all
  erb(:edit_volunteer)
end

post('/project/:id/edit') do
  @project = Project.find(params["id"].to_i)
    binding.pry
  @volunteer = Volunteer.find(params["id"].to_i)
  volunteer_ids = params["volunteer_ids"]
  project_id = @project.id

  @volunteer.update({:project_id => project_id})
  @volunteers = Volunteer.all
  @projects = Project.all
  erb(:edit_project)
end

delete('/project/:id/edit') do
  @project = Project.find(params.fetch("id").to_i)
  @project.delete()
  @projects = Project.all
  redirect '/'
end
