class CustomerRepository
 attr_reader :filename,
             :engine

  #Deal with the filename its useless only tests are using it!!
  #All method needs to be broken up, you want the objects to be stored
  #Into a private method and assigned to a variable in the all method
  def initialize(filename = "./data/customers.csv", engine)
    @filename = filename
    @engine   = engine
  end

  def read_file
    filename = './data/customers.csv'
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def all
    @customers ||= read_file.collect { |customer| Customer.new(customer, self) }
  end

  def random
    all.sample
  end

  %w(id first_name last_name created_at updated_at).each do |var|
    define_method "find_by_#{var}" do |value|
      all.find {|customer| customer.send(var).downcase == value.downcase }
    end
  end

  %w(id first_name last_name created_at updated_at).each do |var|
    define_method "find_all_by_#{var}" do |value|
      all.select { |customer| customer.send(var).downcase == value.downcase }
    end
  end

end
