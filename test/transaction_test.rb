require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction'
require 'csv'
require './lib/transaction_repository'

class TransactionTest < MiniTest::Test
  attr_reader :repo

  def contents
    CSV.read "./data/transactions.csv", headers: true, header_converters: :symbol
  end

  def transaction_attributes
      contents.each do |row|
        id                          = row[:id],
        invoice_id                  = row[:invoice_id],
        credit_card_number          = row[:credit_card_number],
        credit_card_expiration_date = row[:credit_card_expiration_date],
        result                      = row[:result],
        created_at                  = row[:created_at],
        updated_at                  = row[:updated_at]
      end
    end

  def transaction
    @transaction ||= Transaction.new(transaction_attributes, repo)
  end

  def test_transaction_id
    #skip
    assert_equal transaction_attributes[:id], transaction.id
  end

  def test_invoice_id
    #skip
    assert_equal transaction_attributes[:invoice_id], transaction.invoice_id
  end

  def test_credit_card_number
    #skip
    assert_equal transaction_attributes[:credit_card_number], transaction.credit_card_number
  end

  def test_credit_card_expiration_date
    #skip
    assert_equal transaction_attributes[:credit_card_expiration_date], transaction.credit_card_expiration_date
  end

  def test_result
    #skip
    assert_equal transaction_attributes[:result], transaction.result
  end

  def test_created_at
    #skip
    assert_equal transaction_attributes[:created_at], transaction.created_at
  end

  def test_updated_at
    #skip
    assert_equal transaction_attributes[:updated_at], transaction.updated_at
  end
end

