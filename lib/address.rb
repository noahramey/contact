class Address
  @@addresses = []
  attr_reader(:street, :city, :state, :zip, :type)

  define_method(:initialize) do |attributes|
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip = attributes.fetch(:zip)
    @type = attributes.fetch(:type)
    @id = @@addresses.length.+(1)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@addresses
  end

  define_method(:save) do
    @@addresses.push(self)
  end

  define_singleton_method(:clear) do
    @@addresses = []
  end

  define_singleton_method(:find) do |id|
    found_address = nil
    @@addresses.each() do |address|
      if address.id().eql?(id)
        found_address = address
      end
    end
    found_address
  end
end
