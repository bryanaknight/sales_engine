require "./lib/merchant"
require "pry"
require "csv"
require './lib/sales_engine'

class MerchantRepository
 attr_reader :filename, :engine
  def initialize(filename = "./data/merchants.csv", engine)
    @filename = filename
    @engine = engine
  end

  def read_file
    filename = "./data/merchants.csv"
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def all
    merchants = read_file.collect {|merchant| Merchant.new(merchant, self)}
  end

  def random
    all.sample
  end

  %w(id name created_at updated_at).each do |var|
    define_method "find_by_#{var}" do |value|
      all.find {|merchant| merchant.send(var).downcase == value.downcase }
    end
  end

  %w(id name created_at updated_at).each do |var|
    define_method "find_all_by_#{var}" do |value|
      all.select { |merchant| merchant.send(var).downcase == value.downcase }
    end
  end

end

  #%w(name age gender).each do |var|
  #  define_method "this_is_#{var}" do |input|
  #    puts "#{var} is #{input}"
  #  end
  #end
  #binding.pry
  #def name(input)
  #  puts "#{name} is #{input}"
  #end
  #def age(input)
  #  puts "#{age} is #{input}"
  #end
  #def gender(input)
  #  puts "#{gender} is #{input}"
  #end
