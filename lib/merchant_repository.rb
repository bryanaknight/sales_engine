class MerchantRepository
 attr_reader :filename,
             :engine
  def initialize(filename = "./data/merchants.csv", engine)
    @filename = filename
    @engine = engine
  end

  def read_file
    filename = "./data/merchants.csv"
    CSV.read filename, headers: true, header_converters: :symbol
  end

  def all
    @all ||= read_file.collect {|merchant| Merchant.new(merchant, self)}
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

  def lowest_to_highest_quantity
    all.sort_by do |merchant|
      merchant.quantity
    end
  end

  def higest_to_lowest_quantity
    lowest_to_highest_quantity.reverse
  end

  def most_items(number_of_merchants)
    higest_to_lowest_quantity[0,number_of_merchants]
  end

  def lowest_to_highest_sorted
    all.sort_by do |merchant|
      merchant.revenue
    end
  end

  def higest_to_lowest_sorted
    lowest_to_highest_sorted.reverse
  end

  def most_revenue(number_of_merchants)
    higest_to_lowest_sorted[0,number_of_merchants]
  end

  def revenue(date)
    all do |merchant, sum|
      sum += merchant.revenue(date)
    end
  end

end
