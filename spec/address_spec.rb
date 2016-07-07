require('rspec')
require('address')

describe(Address) do
  before() do
    Address.clear()
  end

  describe('#street') do
    it('returns street address from the full address') do
      address1 = Address.new({:street => "828 NE 69th Ave", :city => "Portland", :state => "Oregon", :zip => 97213})
      expect(address1.street()).to(eq("828 NE 69th Ave"))
    end
  end

  describe('#city') do
    it('returns the city from the full address') do
      address1 = Address.new({:street => "828 NE 69th Ave", :city => "Portland", :state => "Oregon", :zip => 97213})
      expect(address1.city()).to(eq("Portland"))
    end
  end

  describe('#state') do
    it('returns the state from the full address') do
      address1 = Address.new({:street => "828 NE 69th Ave", :city => "Portland", :state => "Oregon", :zip => 97213})
      expect(address1.state()).to(eq("Oregon"))
    end
  end

  describe('#zip') do
    it('returns the zip from the full address') do
      address1 = Address.new({:street => "828 NE 69th Ave", :city => "Portland", :state => "Oregon", :zip => 97213})
      expect(address1.zip()).to(eq(97213))
    end
  end

  describe('.all') do
    it('returns the address array, which is empty') do
      expect(Address.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('empties the address array') do
      expect(Address.clear()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves the address to the address array') do
      address1 = Address.new({:street => "828 NE 69th Ave", :city => "Portland", :state => "Oregon", :zip => 97213})
      address1.save()
      expect(Address.all()).to(eq([address1]))
    end
  end

  describe('#id') do
    it('returns the id of the address') do
      address1 = Address.new({:street => "828 NE 69th Ave", :city => "Portland", :state => "Oregon", :zip => 97213})
      expect(address1.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns the address that matches the id in the address array') do
      address1 = Address.new({:street => "828 NE 69th Ave", :city => "Portland", :state => "Oregon", :zip => 97213})
      address1.save()
      address2 = Address.new({:street => "9019 SW Broadleaf Dr", :city => "Portland", :state => "Oregon", :zip => 97219})
      address2.save()
      expect(Address.find(address2.id())).to(eq(address2))
    end
  end
end
