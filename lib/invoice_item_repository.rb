require "./lib/invoice_items"
require "pry"
require "csv"
require './lib/sales_engine'

class InvoiceItemRepository
 attr_reader :filename, :engine

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
      all.find {|invoice_item| invoice_item.send(var).to_s.downcase == value.to_s.downcase }
    end
  end

  %w(id item_id invoice_id quantity unit_price created_at updated_at).each do |var|
    define_method "find_all_by_#{var}" do |value|
      all.select { |invoice_item| invoice_item.send(var).to_s.downcase == value.to_s.downcase }
    end
  end

end

#Add functionality to type attribute
  #where the attribute does not have to
  #be a symbol.
  #def find_by_attribute(attribute, value)
  #  all.find { |invoice_item| invoice_item.send(attribute).downcase == value.downcase}
  #end

  #def find_all_by_attribute(attribute, value)
  #  all.select { |invoice_item| invoice_item.send(attribute).downcase == value.downcase}
  #end
