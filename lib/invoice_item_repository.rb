class InvoiceItemRepository
 attr_reader :filename,
              :engine

  def initialize(filename = "./data/invoice_items.csv", engine)
    @filename = filename
    @engine = engine
  end

  def read_file
    filename = './data/invoice_items.csv'
    CSV.read filename, headers: true, header_converters: :symbol
  end

  def all
    @all ||= read_file.collect {|row| InvoiceItem.new(row, self)}
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
