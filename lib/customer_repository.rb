require "customer"
require "pry"
require "csv"

class CustomerRepository
 attr_reader :filename
  def initialize(filename = "./data/customers.csv")
    @filename = filename
  end

  def read_file
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def customer_objects
    customers = read_file.collect do |customer|
      Customer.new(customer)
    end
  end

  def random
    customer_objects.sample
  end

  def find_by_attribute(attribute, value)
    customer_objects.find do |customer|
      customer.send(attribute).downcase == value.downcase
    end
  end

  def find_by_id(value)
    find_by_attribute(:id, value)
  end

  def find_by_first_name(value)
    find_by_attribute(:first_name, value)
  end

  def find_by_last_name(value)
    find_by_attribute(:last_name, value)
  end

  def find_by_created_at(value)
    find_by_attribute(:created_at, value)
  end

  def find_by_updated_at(value)
    find_by_attribute(:updated_at, value)
  end
  
  def find_all_by_attribute(attribute, value)
    customer_objects.select do |customer|
      customer.send(attribute).downcase == value.downcase
    end
  end

  def find_all_by_id(value)
    find_all_by_attribute(:id, value)
  end

  def find_all_by_first_name(value)
    find_all_by_attribute(:first_name, value)
  end

  def find_all_by_last_name(value)
    find_all_by_attribute(:last_name, value)
  end

  def find_all_by_created_at(value)
    find_all_by_attribute(:created_at, value)
  end

  def find_all_by_updated_at(value)
    find_all_by_attribute(:updated_at, value)
  end
end
