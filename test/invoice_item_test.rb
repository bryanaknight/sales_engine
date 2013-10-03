require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_item'
require 'csv'
require './lib/invoice_item_repository'


class InvoiceItemTest < MiniTest::Test
  attr_reader :engine,
              :repo,
              :invoice_items,
              :invoice_item

  def setup
    @engine = SalesEngine.new
    @repo = engine.invoice_item_repository
    @invoice_items = engine.invoice_item_repository.all
    @invoice_item = invoice_items.first
  end

  def test_invoice_item_id
    #skip
    assert_equal '1', invoice_item.id
  end

  def test_item_id
    #skip
    assert_equal '135', invoice_item.item_id
  end

  def test_invoice_id
    #skip
    assert_equal '1', invoice_item.invoice_id
  end

  def test_quantity
    assert_equal "5", invoice_item.quantity
  end

  def test_unit_price
    assert_equal "13635", invoice_item.unit_price
  end

  def test_created_at
    #skip
    assert_equal '2012-03-27 14:54:09 UTC', invoice_item.created_at
  end

  def test_updated_at
    #skip
    assert_equal '2012-03-27 14:54:09 UTC', invoice_item.updated_at
  end

  def test_invoice_returns_invoice_by_invoice_item_id
    assert_equal '26', invoice_item.invoice.merchant_id
  end

  def test_invoices_returns_items
    assert_equal "Item Explicabo Iste", invoice_item.item.name
  end

  def test_price
    assert_equal 68175, invoice_item.price
  end

  def test_not_paid_invoice
    refute invoice_item.not_paid_invoice_item?
  end

end
