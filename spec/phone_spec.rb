require('rspec')
require('phone')

describe(Phone) do
  before() do
    Phone.clear()
  end

  describe('#area_code') do
    it('returns area code from the phone number') do
      phone1 = Phone.new({:area_code => 123, :number => 4567890, :type => "cell"})
      expect(phone1.area_code()).to(eq(123))
    end
  end

  describe('#number') do
    it('returns the number from the phone number') do
      phone1 = Phone.new({:area_code => 123, :number => 4567890, :type => "cell"})
      expect(phone1.number()).to(eq(4567890))
    end
  end

  describe('#type') do
    it('returns the type of contact number the phone number is') do
      phone1 = Phone.new({:area_code => 123, :number => 4567890, :type => "cell"})
      expect(phone1.type()).to(eq("cell"))
    end
  end

  describe('.all') do
    it('returns the phone array, which is empty') do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties the phone array') do
      expect(Phone.clear()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the phone to the phone array') do
      phone1 = Phone.new({:area_code => 123, :number => 4567890, :type => "cell"})
      phone1.save()
      expect(Phone.all()).to(eq([phone1]))
    end
  end

  describe('#id') do
    it('returns the id of the phone') do
      phone1 = Phone.new({:area_code => 123, :number => 4567890, :type => "cell"})
      expect(phone1.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns the phone that matches the id in the phone array') do
      phone1 = Phone.new({:area_code => 123, :number => 4567890, :type => "cell"})
      phone1.save()
      phone2 = Phone.new({:area_code => 503, :number => 1234567, :type => "home"})
      phone2.save()
      expect(Phone.find(phone2.id())).to(eq(phone2))
    end
  end
end
