require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/transaction'
require 'csv'
require './lib/transaction_repository'

class TransactionTest < MiniTest::Test
  attr_reader :engine,
              :repo,
              :transactions,
              :transaction

  def setup
    @engine = SalesEngine.new
    @repo = engine.transaction_repository
    @transactions = engine.transaction_repository.all
    @transaction = transactions.first
  end

  def test_transaction_id
    #skip
    assert_equal "1", transaction.id
  end

  def test_invoice_id
    #skip
    assert_equal "1", transaction.invoice_id
  end

  def test_credit_card_number
    #skip
    assert_equal "4.65441E+15", transaction.credit_card_number
  end

  def test_credit_card_expiration_date
    #skip
    assert_equal nil, transaction.credit_card_expiration_date
  end

  def test_result
    #skip
    assert_equal "success", transaction.result
  end

  def test_created_at
    #skip
    assert_equal "2012-03-27 14:54:09 UTC", transaction.created_at
  end

  def test_updated_at
    #skip
    assert_equal "2012-03-27 14:54:09 UTC", transaction.updated_at
  end

  def test_returns_invoice_by_transaction
    assert_equal "26", transaction.invoice.merchant_id
  end

  def test_transaction_successful
    assert transaction.successful?
  end

end

