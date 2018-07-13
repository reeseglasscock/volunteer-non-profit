require('sinatra')
require("sinatra/reloader")
also_reload('lib/**/*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pg')
require('pry')

# configure :development do
#   set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'volunteer_tracker_test', pool: 2}
# end
#
# configure :production do
#   set :database, {adapter: 'postgresql',  encoding: 'unicode', database: 'volunteer_tracker_test', pool: 2}
# end

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
  binding.pry
  erb(:index)
end
