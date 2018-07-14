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
  binding.pry
  erb(:project_details)
end

get('/volunteer/:id') do
  id = params[:id].to_i
  @volunteer = Volunteer.find(id)
  @volunteers = Volunteer.all
  erb(:volunteer_details)
end

get('/project/:id/edit') do
  id = params[:id].to_i
  @project = Project.find(id)
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:edit_project)
end

patch('/project/:id/edit') do
  @projects = Project.all
  @volunteers = Volunteer.all
  new_title = params["update_project"]
  if new_title != nil && new_title != ""
    id = params[:id].to_i
    @project = Project.find(id)
    @project.update({:title => new_title})
    update_title = params["update_project"]
  end
  @projects = Project.all
  erb(:edit_project)
end

post('/project/:id/edit') do
  @project = Project.find(params["id"].to_i)
  volunteer_ids = params["volunteer_ids"]
  if volunteer_ids != []
    id = params[:id].to_i
    @project = Project.find(id)
    @project.update({:title => new_title})
    update_title = params["update_project"]
  end
  @projects = Project.all
  erb(:edit_project)
end



delete('/project/:id/edit') do
  @project = Project.find(params.fetch("id").to_i)
  @project.delete()
  @projects = Project.all
  redirect '/'
end
