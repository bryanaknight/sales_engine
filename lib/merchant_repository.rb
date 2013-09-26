require "merchant"
require "pry"
require "csv"

class MerchantRepository
 attr_reader :filename
  def initialize(filename = "./data/merchants.csv")
    @filename = filename
  end

  def read_file
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def merchant_objects
    merchants_list = read_file.collect do |merchant|
      Merchant.new(merchant)
    end
  end

  def random
    merchant_objects.sample
  end

  def find_by_attribute(attribute, value)
    merchant_objects.find do |merchant|
      merchant.send(attribute).downcase == value.downcase
    end
  end

  def find_by_name(value)
    find_by_attribute(:name, value)
  end

  def find_by_id(value)
    find_by_attribute(:id, value)
  end

  def find_by_created_at(value)
    find_by_attribute(:created_at, value)
  end

  def find_by_updated_at(value)
    find_by_attribute(:updated_at, value)
  end
  
  def find_all_by_attribute(attribute, value)
    merchant_objects.select do |merchant|
      merchant.send(attribute).downcase == value.downcase
    end
  end

  def find_all_by_name(value)
    find_all_by_attribute(:name, value)
  end

  def find_all_by_id(value)
    find_all_by_attribute(:id, value)
  end

  def find_all_by_created_at(value)
    find_all_by_attribute(:created_at, value)
  end

  def find_all_by_updated_at(value)
    find_all_by_attribute(:updated_at, value)
  end
end
