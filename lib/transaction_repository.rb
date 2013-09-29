require "pry"
require "csv"
require './lib/transaction'
require './lib/sales_engine'

class TransactionRepository
 attr_reader :filename,
             :engine

  def initialize(filename = "./data/transactions.csv", engine)
    @filename = filename
    @engine   = engine
  end

  def read_file
    filename = "./data/transactions.csv"
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def all
    transactions = read_file.collect { |transaction| Transaction.new(transaction, self)}
  end

  def random
    all.sample
  end

  %w(id invoice_id credit_card_number credit_card_expiration_date result created_at updated_at).each do |var|
    define_method "find_by_#{var}" do |value|
      all.find {|transaction| transaction.send(var).to_s.downcase == value.to_s.downcase }
    end
  end

  %w(id invoice_id credit_card_number credit_card_expiration_date result created_at updated_at).each do |var|
    define_method "find_all_by_#{var}" do |value|
      all.select { |transaction| transaction.send(var).to_s.downcase == value.to_s.downcase }
    end
  end

end
