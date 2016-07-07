class Contact
  @@contacts = []
  attr_reader(:first, :last, :job, :company)

  define_method(:initialize) do |attributes|
    @first = attributes.fetch(:first)
    @last = attributes.fetch(:last)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
    @id = @@contacts.length.+(1)
    @phones = []
    @addresses = []
    @emails = []
  end

  define_method(:id) do
    @id
  end

  define_method(:phones) do
    @phones
  end

  define_method(:addresses) do
    @addresses
  end

  define_method(:emails) do
    @emails
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

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end

  define_method(:add_phone) do |phone|
    @phones.push(phone)
  end

  define_method(:add_address) do |address|
    @addresses.push(address)
  end

  define_method(:add_email) do |email|
    @emails.push(email)
  end
end
