require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/transaction_repository"
require './lib/sales_engine'

class TransactionRepositoryTest < MiniTest::Test
  attr_reader :tr
              :engine

  def setup
    @engine = SalesEngine.new
    @tr = TransactionRepository.new(nil, @engine)
  end

  def test_find_by_id
    assert_equal '1', tr.find_by_id('1').invoice_id
  end

  def test_find_by_invoice_id
    assert_equal "3", tr.find_by_invoice_id('4').id
  end

  def test_find_by_credit_card_number
    assert_equal '4.84452E+15', tr.find_by_credit_card_number('4.84452E+15').credit_card_number
  end

  #def test_find_by_credit_card_expiration_date
  #  #assert_equal nil, tr.find_by_credit_card_expiration_date(nil)
  #end

  def test_find_by_result
    assert_equal '1', tr.find_by_result('success').id
  end

  def test_find_by_created_at
    assert_equal '1', tr.find_by_created_at('2012-03-27 14:54:09 UTC').id
  end

   def test_find_by_updated_at
    assert_equal '1', tr.find_by_updated_at('2012-03-27 14:54:09 UTC').id
  end

  def test_find_all_by_id
    assert_equal 1, tr.find_all_by_id('1').size
  end

  def find_all_by_invoice_id
    assert_equal 1, tr.find_all_by_invoice_id('1').size
  end

  def find_all_by_credit_card_number
    assert_equal 1, tr.find_all_by_credit_card_number('4.84452E+15').size
  end

  def find_all_by_credit_card_expiration
    assert_equal 10, tr.find_all_by_credit_card_expiration('30/10/89').size
  end

  def find_all_by_created_at
    assert_equal 1, tr.find_all_by_created_at('2012-03-27 14:54:09 UTC').size
  end

  def find_all_by_updated_at
    assert_equal 1, tr.find_all_by_updated_at('2012-03-27 14:54:09 UTC').size
  end

  def test_get_random_merchant_object
    results = []
    20.times {results << tr.random}
    assert results.uniq.count > 1
  end

 end
