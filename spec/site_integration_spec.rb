require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the site path', {:type => :feature}) do
  it('takes the user on a tour through the sites basic functionality') do
    visit('/')
    click_on('Create New Contact')
    fill_in('first', :with => 'Noah')
    fill_in('last', :with => 'Ramey')
    fill_in('job', :with => 'none')
    fill_in('company', :with => 'none')
    click_on('Create Contact')
    click_on('View All Contacts')
    click_on('Noah Ramey')
    click_on('Add a new phone number')
    fill_in('type', :with => 'cell')
    fill_in('area_code', :with => '503')
    fill_in('number', :with => '1234567')
    click_on('Add Number')
    click_on('View All Contacts')
    click_on('Noah Ramey')
    expect(page).to have_content('cell phone: (503) 1234567')
  end
end
