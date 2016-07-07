require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/address')
require('./lib/contact')
require('./lib/email')
require('./lib/phone')

get('/') do
  erb(:index)
end
