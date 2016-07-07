require('rspec')
require('contact')
require('email')
require('phone')
require('address')

describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#first') do
    it('returns the first name of the contact') do
      test_contact = Contact.new({:first => "John", :last => "Smith", :job => "Ruby Developer", :company => "Epicodus"})
      expect(test_contact.first()).to(eq("John"))
    end
  end

  describe('#last') do
    it('returns the last name of the contact') do
      test_contact = Contact.new({:first => "John", :last => "Smith", :job => "Ruby Developer", :company => "Epicodus"})
      expect(test_contact.last()).to(eq("Smith"))
    end
  end

  describe('#job') do
    it('returns the job title of the contact') do
      test_contact = Contact.new({:first => "John", :last => "Smith", :job => "Ruby Developer", :company => "Epicodus"})
      expect(test_contact.job()).to(eq("Ruby Developer"))
    end
  end

  describe('#company') do
    it('returns the company the contact belongs to') do
      test_contact = Contact.new({:first => "John", :last => "Smith", :job => "Ruby Developer", :company => "Epicodus"})
      expect(test_contact.company()).to(eq("Epicodus"))
    end
  end

  describe('.all') do
    it('returns the contact array, which is empty') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the contact to the contact array') do
      test_contact = Contact.new({:first => "John", :last => "Smith", :job => "Ruby Developer", :company => "Epicodus"})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe('#id') do
    it('returns the id of the contact') do
      test_contact = Contact.new({:first => "John", :last => "Smith", :job => "Ruby Developer", :company => "Epicodus"})
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns the contact that matches the id in the contact array') do
      test_contact = Contact.new({:first => "John", :last => "Smith", :job => "Ruby Developer", :company => "Epicodus"})
      test_contact.save()
      test_contact2 = Contact.new({:first => "Robert", :last => "Smith", :job => "Ruby on Rails Developer", :company => "Company"})
      test_contact2.save()
      expect(Contact.find(test_contact2.id())).to(eq(test_contact2))
    end
  end

  describe('#add_phone') do
    it("adds a new phone to a contact") do
      contact1 = Contact.new({:first => "John", :last => "Smith", :job => "Ruby Developer", :company => "Epicodus"})
      phone1 = Phone.new({:area_code => 123, :number => 4567890, :type => "cell"})
      contact1.add_phone(phone1)
      expect(contact1.phones()).to(eq([phone1]))
    end
  end

  describe('#add_email') do
    it("adds a new email to a contact") do
      contact1 = Contact.new({:first => "John", :last => "Smith", :job => "Ruby Developer", :company => "Epicodus"})
      email1 = Email.new({:address => "person@example.com", :type => "home"})
      contact1.add_email(email1)
      expect(contact1.emails()).to(eq([email1]))
    end
  end

  describe('#add_address') do
    it("adds a new address to a contact") do
      contact1 = Contact.new({:first => "John", :last => "Smith", :job => "Ruby Developer", :company => "Epicodus"})
      address1 = Address.new({:street => "828 NE 69th Ave", :city => "Portland", :state => "Oregon", :zip => 97213})
      contact1.add_address(address1)
      expect(contact1.addresses()).to(eq([address1]))
    end
  end
end
