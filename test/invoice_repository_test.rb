require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice_repository"
require './lib/sales_engine'

class InvoiceRepositoryTest < MiniTest::Test
  attr_reader :invoices, :engine

  def setup
    @engine = SalesEngine.new
    @invoices = InvoiceRepository.new(nil, @engine)
  end

  def test_find_by_id
    #skip
    assert_equal '3', invoices.find_by_id('3').id
  end

  def test_find_by_customer_id
   # skip
    assert_equal '3', invoices.find_by_customer_id('3').customer_id
  end

  def test_find_by_merchant_id
   # skip
    assert_equal '26', invoices.find_by_merchant_id('26').merchant_id
  end

  def test_find_by_status
   # skip
    assert_equal 'shipped', invoices.find_by_status('shipped').status
  end

  def test_find_by_created_at
   # skip
    assert_equal '2012-03-25', invoices.find_by_created_at('2012-03-25').created_at
  end

  def test_find_by_updated_at
   # skip
    assert_equal '2012-03-25', invoices.find_by_updated_at('2012-03-25').updated_at
  end


  def test_find_all_by_id
   # skip
    assert_equal 1, invoices.find_all_by_id('3').size
  end

  def test_find_all_by_customer_id
    #skip
    assert_equal 4, invoices.find_all_by_customer_id('3').size
  end

  def test_find_all_by_merchant_id
    #skip
    assert_equal 1, invoices.find_all_by_merchant_id('26').size
  end

  def test_find_all_by_status
    #skip
    assert_equal 135, invoices.find_all_by_status('shipped').size
  end

  def test_find_all_by_created_at
    #skip
    assert_equal 4, invoices.find_all_by_created_at('2012-03-25').size
  end

  def test_find_all_by_updated_at
    #skip
    assert_equal 4, invoices.find_all_by_updated_at('2012-03-25').size
  end

  def test_get_random_invoice_object
    results = []
    30.times{ results << invoices.all }
    assert results.uniq.count > 1
  end
end
