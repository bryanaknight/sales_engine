require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_items'
require 'csv'
require './lib/invoice_item_repository'


class InvoiceItemsTest < MiniTest::Test
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

  # def invoice_items
  #   #skip
  #   @invoice_items ||= InvoiceItems.new(item_attributes, @repo)
  # end

  def test_invoice_items_id
    #skip
    assert_equal '1', invoice_item.id
  end

  def test_item_id
    #skip
    assert_equal '539', invoice_item.item_id
  end

  def test_invoice_id
    #skip
    assert_equal '1', invoice_item.invoice_id
  end

  def test_quantity
    #skip
    assert_equal '5', invoice_item.quantity
  end

  def test_unit_price
    assert_equal '13635', invoice_item.unit_price
  end

  def test_created_at
    #skip
    assert_equal '2012-03-27 14:54:09 UTC', invoice_item.created_at
  end

  def test_updated_at
    #skip
    assert_equal '2012-03-27 14:54:09 UTC', invoice_item.updated_at
  end

  def test_invoices_returns_invoice_items
    # binding.pry
    assert_equal 1, invoice_item.invoices.size
  end

  def test_invoices_returns_items
    assert_equal 1, invoice_item.items.size
  end

end
