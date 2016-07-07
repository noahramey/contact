class Contact
  @@contacts = []
  attr_reader(:first, :last, :job, :company)

  define_method(:initialize) do |attributes|
    @first = attributes.fetch(:first)
    @last = attributes.fetch(:last)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
    @id = @@contacts.length.+(1)
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end
end
