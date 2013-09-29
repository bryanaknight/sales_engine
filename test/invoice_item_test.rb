require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/invoice_items'
require 'csv'
require './lib/invoice_item_repository'


class InvoiceItemsTest < MiniTest::Test
  attr_reader :repo

  def contents
    CSV.read "./data/invoice_items.csv", headers: true, header_converters: :symbol
  end

  def item_attributes
    contents.each do |row|
      id         = row[:id]
      item_id    = row[:item_id]
      invoice_id = row[:invoice_id]
      quantity   = row[:quantity]
      unit_price = row[:unit_price]
      created_at = row[:created_at]
      updated_at = row[:updated_at]
    end
  end

  def invoice_items
    #skip
    @invoice_items ||= InvoiceItems.new(item_attributes, @repo)
  end

  def test_invoice_items_id
    #skip
    assert_equal item_attributes[:id], invoice_items.id
  end

  def test_item_id
    #skip
    assert_equal item_attributes[:item_id], invoice_items.item_id
  end

  def test_invoice_id
    #skip
    assert_equal item_attributes[:invoice_id], invoice_items.invoice_id
  end

  def test_quantity
    #skip
    assert_equal item_attributes[:quantity], invoice_items.quantity
  end

  def test_unit_price
    assert_equal item_attributes[:unit_price], invoice_items.unit_price
  end

  def test_created_at
    #skip
    assert_equal item_attributes[:created_at], invoice_items.created_at
  end

  def test_updated_at
    #skip
    assert_equal item_attributes[:updated_at], invoice_items.updated_at
  end

end
