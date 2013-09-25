require "invoice"
require "pry"
require "csv"

class InvoiceRepository
 attr_reader :filename
  def initialize(filename = "./data/invoices.csv")
    @filename = filename
  end

  def read_file
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def invoice_objects
    invoices = read_file.collect do |invoice|
      Invoice.new(invoice)
    end
  end

  #This is some random shit!!!
  def random_invoice_object
    invoice_objects.sample
  end
  
  #Add functionality to type attribute
  #where the attribute does not have to
  #be a symbol.
  def find_by_attribute(attribute, value)
    invoice_objects.find do |invoice|
      invoice.send(attribute).downcase == value.downcase
    end
  end
  
  def find_all_by_attribute(attribute, value)
    invoice_objects.select do |invoice|
      invoice.send(attribute).downcase == value.downcase
    end
  end

end
