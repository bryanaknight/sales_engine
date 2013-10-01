require "./lib/invoice_items"
require "pry"
require "csv"
require './lib/sales_engine'

class InvoiceItemRepository
 attr_reader :filename,
              :engine

  def initialize(filename = "./data/invoice_items.csv", engine)
    @filename = filename
    @engine = engine
  end

  def read_file
    filename = './data/invoice_items.csv'
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def all
    invoice_items = read_file.collect {|invoice_item| InvoiceItems.new(invoice_item, self)}
  end

  def random
    all.sample
  end

  %w(id item_id invoice_id quantity unit_price created_at updated_at).each do |var|
    define_method "find_by_#{var}" do |value|
      all.find { |invoice_item| invoice_item.send(var).downcase == value.downcase }
    end
  end

  %w(id item_id invoice_id quantity unit_price created_at updated_at).each do |var|
    define_method "find_all_by_#{var}" do |value|
      all.select { |invoice_item| invoice_item.send(var).downcase == value.downcase }
    end
  end

end
