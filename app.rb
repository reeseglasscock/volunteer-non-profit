require('sinatra')
require("sinatra/reloader")
also_reload('lib/**/*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pg')
require('pry')

# DB = PG.connect({:dbname => "train_system_test"})

get('/') do
  erb(:index)
end
