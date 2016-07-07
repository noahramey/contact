require('rspec')
require('contact')

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
    
  end
end
