class InvoiceRepository
 attr_reader :filename,
             :engine

  def initialize(filename = "./data/invoices.csv", engine)
    @filename = filename
    @engine = engine
  end

  def read_file
    filename = "./data/invoices.csv"
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def all
    @invoices ||= read_file.collect {|invoice| Invoice.new(invoice, self) }
  end

  def random
    all.sample
  end

  %w(id customer_id merchant_id status created_at updated_at).each do |var|
    define_method "find_by_#{var}" do |value|
      all.find {|invoice| invoice.send(var).downcase == value.downcase }
    end
  end

  %w(id customer_id merchant_id status created_at updated_at).each do |var|
    define_method "find_all_by_#{var}" do |value|
      all.select { |invoice| invoice.send(var).downcase == value.downcase }
    end
  end


end
