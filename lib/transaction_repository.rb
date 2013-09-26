require "transaction"
require "pry"
require "csv"

class TransactionRepository
 attr_reader :filename
  def initialize(filename = "./data/transactions.csv")
    @filename = filename
  end

  def read_file
    rows = CSV.read filename, headers: true, header_converters: :symbol
  end

  def transaction_objects
    transactions = read_file.collect do |transaction|
      Transaction.new(transaction)
    end
  end

  def random
    transaction_objects.sample
  end

  def find_by_attribute(attribute, value)
    transaction_objects.find do |transaction|
      transaction.send(attribute).downcase == value.downcase
    end
  end

  def find_by_id(value)
    find_by_attribute(:id, value)
  end

  def find_by_invoice_id(value)
    find_by_attribute(:invoice_id, value)
  end

  def find_by_credit_card_number(value)
    find_by_attribute(:credit_card_number, value)
  end

  def find_by_credit_card_expiration_date(value)
    find_by_attribute(:credit_card_expiration_date, value)
  end

  def find_by_result(value)
    find_by_attribute(:result, value)
  end

  def find_by_created_at(value)
    find_by_attribute(:created_at, value)
  end

  def find_by_updated_at(value)
    find_by_attribute(:updated_at, value)
  end
  
  def find_all_by_attribute(attribute, value)
    transaction_objects.select do |transaction|
      transaction.send(attribute).downcase == value.downcase
    end
  end

  def find_all_by_id(value)
    find_all_by_attribute(:id, value)
  end

  def find_all_by_invoice_id(value)
    find_all_by_attribute(:invoice_id, value)
  end

  def find_all_by_credit_card_number(value)
    find_all_by_attribute(:credit_card_number, value)
  end

  def find_all_by_credit_card_expiration_date(value)
    find_all_by_attribute(:credit_card_expiration_date, value)
  end

  def find_all_by_result(value)
    find_all_by_result(:result, value)

  def find_all_by_created_at(value)
    find_all_by_attribute(:created_at, value)
  end

  def find_all_by_updated_at(value)
    find_all_by_attribute(:updated_at, value)
  end
  end
end
