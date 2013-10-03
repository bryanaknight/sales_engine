require "./lib/item"
require "pry"
require "csv"
require './lib/sales_engine'

class ItemRepository
 attr_reader :filename, :engine
  def initialize(filename = "./data/items.csv", engine)
    @filename = filename
    @engine = engine
  end

  def read_file
    filename = "./data/items.csv"
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def all
    items_list = read_file.collect {|item| Item.new(item, self) }
  end

  #This is some random shit!!!
  def random
    all.sample
  end

  %w(id name description unit_price merchant_id created_at updated_at).each do |var|
    define_method "find_by_#{var}" do |value|
      all.find {|item| item.send(var).downcase == value.downcase }
    end
  end

  %w(id name description unit_price merchant_id created_at updated_at).each do |var|
    define_method "find_all_by_#{var}" do |value|
      all.select { |item| item.send(var).downcase == value.downcase }
    end
  end

  def lowest_to_highest_sorted
    all.sort_by do |item|
      item.revenue
    end
  end

  def higest_to_lowest_sorted
    lowest_to_highest_sorted.reverse
  end

  def most_revenue(number_of_items)
    higest_to_lowest_sorted[0,number_of_items]
  end
end
