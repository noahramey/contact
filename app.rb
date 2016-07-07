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

get('/contacts/new') do
  erb(:contacts_form)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

post('/contacts') do
  @contact = Contact.new({:first => params.fetch("first"), :last => params.fetch("last"), :job => params.fetch("job"), :company => params.fetch("company")})
  @contact.save()
  @contacts = Contact.all()
  erb(:contact_success)
end

get('/contacts/:id') do
  @contacts = Contact.all()
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact)
end

get('/contacts/:id/phones/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact_phones_form)
end

post('/phones') do
  @phone = Phone.new({:area_code => params.fetch('area_code'), :number => params.fetch('number'), :type => params.fetch('type')})
  @phone.save()
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_phone(@phone)
  erb(:phone_success)
end

get('/contacts/:id/emails/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact_emails_form)
end

post('/emails') do
  @email = Email.new({:address => params.fetch('address'), :type => params.fetch('type')})
  @email.save()
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_email(@email)
  erb(:email_success)
end

get('/contacts/:id/addresses/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact_addresses_form)
end

post('/addresses') do
  @address = Address.new({:street => params.fetch('street'), :city => params.fetch('city'), :state => params.fetch('state'), :zip => params.fetch('zip'), :type => params.fetch('type')})
  @address.save()
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_address(@address)
  erb(:address_success)
end
