require "invoice_items"
require "pry"
require "csv"

class InvoiceItemRepository
 attr_reader :filename
 
  def initialize(filename = "./data/invoice_items.csv")
    @filename = filename
  end

  def read_file
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def invoice_item_objects
    invoice_items = read_file.collect do |invoice_item|
      InvoiceItems.new(invoice_item)
    end
  end

  #This is some random shit!!!
  def random
    invoice_item_objects.sample
  end
  
  #Add functionality to type attribute
  #where the attribute does not have to
  #be a symbol.
  def find_by_attribute(attribute, value)
    invoice_item_objects.find do |invoice_item|
      invoice_item.send(attribute).downcase == value.downcase
    end
  end
  
  def find_all_by_attribute(attribute, value)
    invoice_item_objects.select do |invoice_item|
      invoice_item.send(attribute).downcase == value.downcase
    end
  end

  %w(id item_id invoice_id quantity unit_price created_at updated_at).each do |var|
    define_method "find_by_#{var}" do |value|
      find_by_attribute("#{var}", "#{value}")
    end
  end

  %w(id item_id invoice_id quantity unit_price created_at updated_at).each do |var|
    define_method "find_all_by_#{var}" do |value|
      find_all_by_attribute("#{var}", "#{value}")
    end
  end

end
