require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice_item_repository"
require "./lib/sales_engine"

class InvoiceItemRepositoryTest < MiniTest::Test

  attr_reader :invoiceitems,
              :engine

  def setup
    @engine       = SalesEngine.new
    @invoiceitems = engine.invoice_item_repository
  end

  def test_invoice_item_objects_are_created
    assert_equal '135', invoiceitems.all.first.item_id
  end

  def test_find_by_id
    #skip
    assert_equal '3', invoiceitems.find_by_id('3').id
  end

  def test_find_by_invoice_id
    #skip
    assert_equal '1', invoiceitems.find_by_invoice_id('1').invoice_id
  end

  def test_find_by_item_id
    #skip
    assert_equal '534', invoiceitems.find_by_item_id('534').item_id
  end

  def test_find_by_quantity
    #skip
    assert_equal '9', invoiceitems.find_by_quantity('9').quantity
  end

  def test_find_by_unit_price
    #skip
    assert_equal '13635', invoiceitems.find_by_unit_price('13635').unit_price
  end

  def test_find_by_created_at
    #skip
    assert_equal '2012-03-27 14:54:09 UTC', invoiceitems.find_by_created_at('2012-03-27 14:54:09 UTC').created_at
  end

  def test_find_by_updated_at
    #skip
    assert_equal '2012-03-27 14:54:09 UTC', invoiceitems.find_by_updated_at('2012-03-27 14:54:09 UTC').updated_at
  end

  def find_all_by_id
    #skip
    assert_equal 1, invoiceitems.find_all_by_id('1').size
  end

  def test_find_all_by_invoice_id
    # skip
    assert_equal 4, invoiceitems.find_all_by_invoice_id('2').size
  end

  def test_find_all_by_item_id
    #skip
    assert_equal 1, invoiceitems.find_all_by_item_id('530').size
  end

  def test_find_all_by_unit_price
    # skip
    assert_equal 1, invoiceitems.find_all_by_unit_price('1859').size
  end

  def test_find_all_by_quantity
    # skip
    assert_equal 13, invoiceitems.find_all_by_quantity('5').size
  end

  def find_all_by_updated_at
    #skip
    assert_equal 10, invoiceitems.find_all_by_updated_at('2012-03-27 14:53:59 UTC').size
  end

  def find_all_by_created_at
    #skip
    assert_equal 10, invoiceitems.find_all_by_created_at('2012-03-27 14:53:59 UTC').size
  end

  def test_get_random_invoice_object
    #skip
    results = []
    12.times{ results << invoiceitems.random }
    assert results.uniq.count > 1
  end

  def test_find_invoices_for_invoice_item

  end
end
