require './lib/customer'
require "pry"
require "csv"
require "./lib/sales_engine"

class CustomerRepository
 attr_reader :filename,
             :engine

  def initialize(filename = "./data/customers.csv", engine)
    @filename = filename
    @engine   = engine
  end

  def read_file
    filename = './data/customers.csv'
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def all
    customers = read_file.collect { |customer| Customer.new(customer, self) }
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
