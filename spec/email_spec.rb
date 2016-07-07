require('rspec')
require('email')

describe(Email) do
  before() do
    Email.clear()
  end

  describe('#address') do
    it('returns email address from the email') do
      email1 = Email.new({:address => "person@example.com", :type => "home"})
      expect(email1.address()).to(eq("person@example.com"))
    end
  end

  describe('#type') do
    it('returns type from the email') do
      email1 = Email.new({:address => "person@example.com", :type => "home"})
      expect(email1.type()).to(eq("home"))
    end
  end

  describe('.all') do
    it('returns the email array, which is empty') do
      expect(Email.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties the email array') do
      expect(Email.clear()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the email to the email array') do
      email1 = Email.new({:address => "person@example.com", :type => "home"})
      email1.save()
      expect(Email.all()).to(eq([email1]))
    end
  end

  describe('#id') do
    it('returns the id of the email') do
      email1 = Email.new({:address => "person@example.com", :type => "home"})
      expect(email1.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns the email that matches the id in the email array') do
      email1 = Email.new({:address => "person@example.com", :type => "home"})
      email1.save()
      email2 = Email.new({:address => "person2@example.com", :type => "work"})
      email2.save()
      expect(Email.find(email2.id())).to(eq(email2))
    end
  end
end
