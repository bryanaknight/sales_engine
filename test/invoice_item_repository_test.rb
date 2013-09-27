require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/invoice_item_repository"

class InvoiceItemRepositoryTest < MiniTest::Test

  attr_reader :invoiceitems

  def setup
    @invoiceitems = InvoiceItemRepository.new
  end

  def test_invoice_item_objects_are_created
    assert_equal '539', invoiceitems.invoice_item_objects.first.item_id
  end

  def test_find_by_attribute
    assert_equal "79140", invoiceitems.find_by_attribute(:id, '5').unit_price
  end

  def test_find_all_by_attribute
    assert_equal 8, invoiceitems.find_all_by_attribute(:invoice_id, '1').length
  end

  def test_find_by_id
    assert_equal '3', invoiceitems.find_by_id('3').id
  end

  def test_find_by_invoice_id
    assert_equal '1', invoiceitems.find_by_invoice_id('1').invoice_id
  end

  def test_find_by_item_id
    assert_equal '534', invoiceitems.find_by_item_id('534').item_id
  end

  def test_find_by_quantity
    assert_equal '5', invoiceitems.find_by_quantity('5').quantity
  end

  def test_find_by_unit_price
    assert_equal '13635', invoiceitems.find_by_unit_price('13635').unit_price
  end    

  def test_find_by_created_at
    assert_equal '2012-03-27 14:54:09 UTC', invoiceitems.find_by_created_at('2012-03-27 14:54:09 UTC').created_at
  end

  def test_find_by_updated_at
    assert_equal '2012-03-27 14:54:09 UTC', invoiceitems.find_by_updated_at('2012-03-27 14:54:09 UTC').updated_at
  end

  def find_all_by_id
    assert_equal 1, invoiceitems.find_all_by_id('1').size
  end

  def test_find_all_by_invoice_id
    assert_equal 2, invoiceitems.find_all_by_invoice_id('2').size
  end

  def test_find_all_by_item_id
    assert_equal 1, invoiceitems.find_all_by_item_id('530').size
  end

  def test_find_all_by_unit_price
    assert_equal 1, invoiceitems.find_all_by_unit_price('1859').size
  end    

  def test_find_by_quantity
    assert_equal 2, invoiceitems.find_all_by_quantity('5').size
  end

  def find_all_by_updated_at
    assert_equal 10, invoiceitems.find_all_by_updated_at('2012-03-27 14:53:59 UTC').size
  end

  def find_all_by_created_at
    assert_equal 10, invoiceitems.find_all_by_created_at('2012-03-27 14:53:59 UTC').size
  end

  def test_get_random_invoice_object
    results = []
    12.times{ results << invoiceitems.random }
    assert results.uniq.count > 1
  end
end
