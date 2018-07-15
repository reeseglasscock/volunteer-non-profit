require ('./app')
PG.connect(ENV['postgresql-horizontal-60682'])
run Sinatra::Application
